%module vpysdk

%{
#define CALLBACK_TYPE PyObject *
%}

%include "dictionary/python.i"
%include "rc.i"
%include "VP.i"
