// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX cine_addizeus

#include "script_version.hpp"

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define CINE_ADDIZEUS_TAG CINE_ADDIZEUS

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 2.12

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(cine_addizeus - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(cine_addizeus - COMPONENT)
#endif
