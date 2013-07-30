%{
#include "VP.h"

int swig_event_set(VPInstance instance, VPEvent eventname, CALLBACK_TYPE event);
int swig_callback_set(VPInstance instance, VPCallback callbackname, CALLBACK_TYPE callback);
%}

%ignore vp_init;
%init %{
vp_init(VPSDK_VERSION);
%}

%include "typemaps.i"
%apply int * OUTPUT { int * length };

%include "class/create.i"
%include "class/terrain_cell.i"

%include "wrapper/event_set.i"
%include "wrapper/callback_set.i"

%include "VP.h"
