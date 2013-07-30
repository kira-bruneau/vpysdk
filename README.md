vpysdk
======

A Python wrapper for Virtual Paradise developed using SWIG.

This package contains binaries for the SDK which can be obtained from http://dev.virtualparadise.org/downloads.php

Requirements
------------
 - python
 - swig 2.0.10+ (lower versions should work but will have a -Wstrict-prototypes warning on the create class)
 - gcc

Compile Steps
-------------
 > bash setup.sh

Once compiled, the 'vpysdk' folder in 'build' will contain all the files needed to run the VP Python SDK
