int swig_event_set(VPInstance instance, VPEvent eventname, CALLBACK_TYPE event);

%{
static CALLBACK_TYPE swig_events[VP_HIGHEST_EVENT];
static void SwigEvent(VPInstance instance, int eventname) {
  CALLBACK_TYPE func, * arglist;
  CALLBACK_TYPE result;
  
  func = swig_events[eventname];
  //arglist = Py_BuildValue("(O)", SWIG_NewPointerObj(SWIG_as_voidptr(instance), SWIGTYPE_p_void, 0));
  
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

static void vp_event_chat(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_CHAT);
}

static void vp_event_avatar_add(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_AVATAR_ADD);
}

static void vp_event_avatar_change(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_AVATAR_CHANGE);
}

static void vp_event_avatar_delete(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_AVATAR_DELETE);
}

static void vp_event_object(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_OBJECT);
}

static void vp_event_object_change(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_OBJECT_CHANGE);
}

static void vp_event_object_delete(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_OBJECT_DELETE);
}

static void vp_event_object_click(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_OBJECT_CLICK);
}

static void vp_event_world_list(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_WORLD_LIST);
}

static void vp_event_world_setting(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_WORLD_SETTING);
}

static void vp_event_world_settings_changed(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_WORLD_SETTINGS_CHANGED);
}

static void vp_event_friend(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_FRIEND);
}

static void vp_event_world_disconnect(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_WORLD_DISCONNECT);
}

static void vp_event_universe_disconnect(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_UNIVERSE_DISCONNECT);
}

static void vp_event_user_attributes(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_USER_ATTRIBUTES);
}

static void vp_event_cell_end(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_CELL_END);
}

static void vp_event_terrain_node(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_TERRAIN_NODE);
}

static void vp_event_avatar_click(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_AVATAR_CLICK);
}

static void vp_event_teleport(VPInstance instance) {
  SwigEvent(instance, VP_EVENT_TELEPORT);
}

int swig_event_set(VPInstance instance, VPEvent eventname, CALLBACK_TYPE event) {
  Py_XDECREF(swig_events[eventname]);  /* Dispose of previous event callback */
  Py_XINCREF(event);                   /* Add a reference to new event callback */
  swig_events[eventname] = event;      /* Remember new event callback */
  
  switch(eventname) {
    case VP_EVENT_CHAT:
      return vp_event_set(instance, eventname, vp_event_chat);
      break;
    case VP_EVENT_AVATAR_ADD:
      return vp_event_set(instance, eventname, vp_event_avatar_add);
      break;
    case VP_EVENT_AVATAR_CHANGE:
      return vp_event_set(instance, eventname, vp_event_avatar_change);
      break;
    case VP_EVENT_AVATAR_DELETE:
      return vp_event_set(instance, eventname, vp_event_avatar_delete);
      break;
    case VP_EVENT_OBJECT:
      return vp_event_set(instance, eventname, vp_event_object);
      break;
    case VP_EVENT_OBJECT_CHANGE:
      return vp_event_set(instance, eventname, vp_event_object_change);
      break;
    case VP_EVENT_OBJECT_DELETE:
      return vp_event_set(instance, eventname, vp_event_object_delete);
      break;
    case VP_EVENT_OBJECT_CLICK:
      return vp_event_set(instance, eventname, vp_event_object_click);
      break;
    case VP_EVENT_WORLD_LIST:
      return vp_event_set(instance, eventname, vp_event_world_list);
      break;
    case VP_EVENT_WORLD_SETTING:
      return vp_event_set(instance, eventname, vp_event_world_setting);
      break;
    case VP_EVENT_WORLD_SETTINGS_CHANGED:
      return vp_event_set(instance, eventname, vp_event_world_settings_changed);
      break;
    case VP_EVENT_FRIEND:
      return vp_event_set(instance, eventname, vp_event_friend);
      break;
    case VP_EVENT_WORLD_DISCONNECT:
      return vp_event_set(instance, eventname, vp_event_world_disconnect);
      break;
    case VP_EVENT_UNIVERSE_DISCONNECT:
      return vp_event_set(instance, eventname, vp_event_universe_disconnect);
      break;
    case VP_EVENT_USER_ATTRIBUTES:
      return vp_event_set(instance, eventname, vp_event_user_attributes);
      break;
    case VP_EVENT_CELL_END:
      return vp_event_set(instance, eventname, vp_event_cell_end);
      break;
    case VP_EVENT_TERRAIN_NODE:
      return vp_event_set(instance, eventname, vp_event_terrain_node);
      break;
    case VP_EVENT_AVATAR_CLICK:
      return vp_event_set(instance, eventname, vp_event_avatar_click);
      break;
    case VP_EVENT_TELEPORT:
      return vp_event_set(instance, eventname, vp_event_teleport);
      break;
    case VP_HIGHEST_EVENT:
      break;
  }
  
  return VP_RC_NO_SUCH_ATTRIBUTE;
}
%}
