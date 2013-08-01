%{
typedef struct {
  VPInstance instance;
} swig_create;
%}

typedef struct {
  VPInstance instance;
  %extend {
    swig_create() {
      swig_create * bot;
      bot = (swig_create *) malloc(sizeof(swig_create));
      bot->instance = vp_create();
      return bot;
    }
    
    ~swig_create() {
      free($self);
    }
    
    int vp_destroy() {
      return vp_destroy($self->instance);
    }
    
    int vp_connect_universe(const char * host, int port) {
      return vp_connect_universe($self->instance, host, port);
    }
    
    int vp_login(const char * username, const char * password, const char * botname) {
      return vp_login($self->instance, username, password, botname);
    }
    
    int vp_wait(int milliseconds) {
      return vp_wait($self->instance, milliseconds);
    }
    
    int vp_enter(const char * worldname) {
      return vp_enter($self->instance, worldname);
    }
    
    int vp_leave() {
      return vp_leave($self->instance);
    }
    
    int vp_say(const char * message) {
      return vp_say($self->instance, message);
    }
    
    int vp_console_message(
      int session,
      const char * name,
      const char * message,
      int effects,
      unsigned char red,
      unsigned char green,
      unsigned char blue)
    {
      return vp_console_message($self->instance, session, name, message, effects, red, green, blue);
    }
    
    int swig_event_set(VPEvent eventname, PyObject * event) {
      return swig_event_set($self->instance, eventname, event);
    }
    
    int swig_callback_set(VPCallback callbackname, PyObject * callback) {
      return swig_callback_set($self->instance, callbackname, callback);
    }
    
    void * vp_user_data() {
      return vp_user_data($self->instance);
    }
    
    void vp_user_data_set(void * data) {
      vp_user_data_set($self->instance, data);
    }
    
    int vp_state_change() {
      return vp_state_change($self->instance);
    }
    
    int vp_int(VPIntegerProperty name) {
      return vp_int($self->instance, name);
    }
    
    float vp_float(VPFloatProperty name) {
      return vp_float($self->instance, name);
    }
    
    const char * vp_string(VPStringProperty name) {
      return vp_string($self->instance, name);
    }
    
    const char * vp_data(VPDataProperty name, int * length) {
      return vp_data($self->instance, name, length);
    }
    
    int vp_int_set(VPIntegerProperty name, int value) {
      return vp_int_set($self->instance, name, value);
    }
    
    int vp_float_set(VPFloatProperty name, float value) {
      return vp_float_set($self->instance, name, value);
    }
    
    void vp_string_set(VPStringProperty name, const char * value) {
      vp_string_set($self->instance, name, value);
    }
    
    int vp_data_set(VPDataProperty name, int length, char * value) {
      return vp_data_set($self->instance, name, length, value);
    }
    
    int vp_query_cell(int x, int z) {
      return vp_query_cell($self->instance, x, z);
    }
    
    int vp_object_add() {
      return vp_object_add($self->instance);
    }
    
    int vp_object_change() {
      return vp_object_change($self->instance);
    }
    
    int vp_object_delete() {
      return vp_object_delete($self->instance);
    }
    
    int vp_object_click() {
      return vp_object_click($self->instance);
    }
    
    int vp_world_list(int time) {
      return vp_world_list($self->instance, time);
    }
    
    int vp_user_attributes_by_id(int user_id) {
      return vp_user_attributes_by_id($self->instance, user_id);
    }
    
    int vp_user_attributes_by_name(const char * name) {
      return vp_user_attributes_by_name($self->instance, name);
    }
    
    int vp_friends_get() {
      return vp_friends_get($self->instance);
    }
    
    int vp_friend_add_by_name(const char * name) {
      return vp_friend_add_by_name($self->instance, name);
    }
    
    int vp_friend_delete(int friend_id) {
      return vp_friend_delete($self->instance, friend_id);
    }
    
    int vp_terrain_query(int tile_x, int tile_z, int revision[][4]) {
      return vp_terrain_query($self->instance, tile_x, tile_z, revision);
    }
    
    int vp_terrain_node_set(
      int tile_x, int tile_z, 
      int node_x, int node_z, 
      struct vp_terrain_cell_t * cells)
    {
      return vp_terrain_node_set($self->instance, tile_x, tile_z, node_x, node_z, cells);
    }
    
    int vp_avatar_click(int avatar_session) {
      return vp_avatar_click($self->instance, avatar_session);
    }
    
    int vp_teleport_avatar(
      int target_session,
      const char * world,
      float x, float y, float z,
      float yaw, float pitch)
    {
      return vp_teleport_avatar($self->instance, target_session, world, x, y, z, yaw, pitch);
    }

  }
} swig_create;

%ignore vp_create;
%ignore vp_destroy;
%ignore vp_connect_universe;
%ignore vp_login;
%ignore vp_wait;
%ignore vp_enter;
%ignore vp_leave;
%ignore vp_say;
%ignore vp_console_message;
%ignore swig_event_set;
%ignore swig_callback_set;
%ignore vp_user_data;
%ignore vp_user_data_set;
%ignore vp_state_change;
%ignore vp_int;
%ignore vp_float;
%ignore vp_string;
%ignore vp_data;
%ignore vp_int_set;
%ignore vp_float_set;
%ignore vp_string_set;
%ignore vp_data_set;
%ignore vp_query_cell;
%ignore vp_object_add;
%ignore vp_object_change;
%ignore vp_object_delete;
%ignore vp_object_click;
%ignore vp_world_list;
%ignore vp_user_attributes_by_id;
%ignore vp_user_attributes_by_name;
%ignore vp_friends_get;
%ignore vp_friend_add_by_name;
%ignore vp_friend_delete;
%ignore vp_terrain_query;
%ignore vp_terrain_node_set;
%ignore vp_avatar_click;
%ignore vp_teleport_avatar;
