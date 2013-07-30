int swig_callback_set(VPInstance instance, VPCallback callbackname, CALLBACK_TYPE callback);

%{
static CALLBACK_TYPE swig_callbacks[VP_HIGHEST_CALLBACK];
static void SwigCallback(VPInstance instance, int x, int y, int callbackname) {
  CALLBACK_TYPE func, * arglist;
  CALLBACK_TYPE result;
  
  func = swig_callbacks[callbackname];
  //arglist = Py_BuildValue("(Oii)", SWIG_NewPointerObj(SWIG_as_voidptr(instance), SWIGTYPE_p_void, 0), x, y);
  
  swig_create * bot;
  bot = (swig_create *) malloc(sizeof(swig_create));
  bot->instance = instance;
  arglist = Py_BuildValue("(O)", SWIG_NewPointerObj(SWIG_as_voidptr(bot), SWIGTYPE_p_swig_create, 0));
  
  result = PyEval_CallObject(func, arglist);
  Py_DECREF(arglist);
  if (result == NULL)
    PyErr_Print();
  Py_XDECREF(result);
}

static void vp_callback_object_add(VPInstance instance, int x, int y) {
  SwigCallback(instance, x, y, VP_CALLBACK_OBJECT_ADD);
}

static void vp_callback_object_change(VPInstance instance, int x, int y) {
  SwigCallback(instance, x, y, VP_CALLBACK_OBJECT_CHANGE);
}

static void vp_callback_object_delete(VPInstance instance, int x, int y) {
  SwigCallback(instance, x, y, VP_CALLBACK_OBJECT_DELETE);
}

static void vp_callback_get_friends(VPInstance instance, int x, int y) {
  SwigCallback(instance, x, y, VP_CALLBACK_GET_FRIENDS);
}

static void vp_callback_friend_add(VPInstance instance, int x, int y) {
  SwigCallback(instance, x, y, VP_CALLBACK_FRIEND_ADD);
}

static void vp_callback_friend_delete(VPInstance instance, int x, int y) {
  SwigCallback(instance, x, y, VP_CALLBACK_FRIEND_DELETE);
}

static void vp_callback_terrain_query(VPInstance instance, int x, int y) {
  SwigCallback(instance, x, y, VP_CALLBACK_TERRAIN_QUERY);
}

static void vp_callback_terrain_node_set(VPInstance instance, int x, int y) {
  SwigCallback(instance, x, y, VP_CALLBACK_TERRAIN_NODE_SET);
}

int swig_callback_set(VPInstance instance, VPCallback callbackname, CALLBACK_TYPE callback) {
  Py_XDECREF(swig_callbacks[callbackname]);  /* Dispose of previous callback */
  Py_XINCREF(callback);                      /* Add a reference to new callback */
  swig_callbacks[callbackname] = callback;   /* Remember new callback */
  
  switch(callbackname) {
    case VP_CALLBACK_OBJECT_ADD:
      return vp_callback_set(instance, callbackname, vp_callback_object_add);
      break;
    case VP_CALLBACK_OBJECT_CHANGE:
      return vp_callback_set(instance, callbackname, vp_callback_object_change);
      break;
    case VP_CALLBACK_OBJECT_DELETE:
      return vp_callback_set(instance, callbackname, vp_callback_object_delete);
      break;
    case VP_CALLBACK_GET_FRIENDS:
      return vp_callback_set(instance, callbackname, vp_callback_get_friends);
      break;
    case VP_CALLBACK_FRIEND_ADD:
      return vp_callback_set(instance, callbackname, vp_callback_friend_add);
      break;
    case VP_CALLBACK_FRIEND_DELETE:
      return vp_callback_set(instance, callbackname, vp_callback_friend_delete);
      break;
    case VP_CALLBACK_TERRAIN_QUERY:
      return vp_callback_set(instance, callbackname, vp_callback_terrain_query);
      break;
    case VP_CALLBACK_TERRAIN_NODE_SET:
      return vp_callback_set(instance, callbackname, vp_callback_terrain_node_set);
      break;
    case VP_HIGHEST_CALLBACK:
      break;
  }
  
  return 1;
}
%}
