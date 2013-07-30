%extend vp_terrain_cell_t {
  %rename("_texture_set") texture_set(int tex);
  %rename("_rotation_set") rotation_set(int rotate);
  %rename("_visibility_set") visibility_set(int visible);
  %rename("_texture_get") texture_get();
  %rename("_rotation_get") rotation_get();
  %rename("_visibility_get") visibility_get();
  
  %typemap(out) int visibility_get() {
    $result = PyBool_FromLong($1);
  }
  
  vp_terrain_cell_t(float height = 0, int tex = 0, int rotate = 0, int visible = 0) {
    struct vp_terrain_cell_t * tc;
    tc = (struct vp_terrain_cell_t *) malloc(sizeof(struct vp_terrain_cell_t));
    tc->height = height;
    tc->attributes = (tex & 0x0FFF) | (rotate << 13) | (visible << 15);
    return tc;
  }
  
  ~vp_terrain_cell_t() {
    free($self);
  }
  
  void apply(int tex, int rotate, int visible) {
    $self->attributes = (tex & 0x0FFF) | (rotate << 13) | (visible << 15);
  }
  
  void texture_set(int tex) {
    $self->attributes = ($self->attributes & 0x7800) | (tex & 0x0FFF);
  }
  
  void rotation_set(int rotate) {
    $self->attributes = ($self->attributes & 0x9FFF) | ((rotate & 0x0003) << 13);
  }
  
  void visibility_set(int visible) {
    $self->attributes = ($self->attributes & 0x7FFF) | ((visible & 0x0001) << 15);
  }

  int texture_get() {
    return $self->attributes & 0x0FFF;
  }
  
  int rotation_get() {
    return ($self->attributes >> 13) & 0x0003;
  }
  
  int visibility_get() {
    return $self->attributes >> 15;
  }
  
  %pythoncode %{
    __swig_getmethods__["texture"] = _texture_get
    __swig_setmethods__["texture"] = _texture_set
    if _newclass:texture = property(_texture_get, _texture_set)
    
    __swig_getmethods__["rotation"] = _rotation_get
    __swig_setmethods__["rotation"] = _rotation_set
    if _newclass:rotation = property(_rotation_get, _rotation_set)
    
    __swig_getmethods__["visibility"] = _visibility_get
    __swig_setmethods__["visibility"] = _visibility_set
    if _newclass:visibility = property(_visibility_get, _visibility_set)
  %}
};
