Scriptname DLC1HunterCaveMultiPlateMasterSCRIPT extends ObjectReference  

; //this is the master control holder for our plate puzzle.
; //the other pressure plates will link to this script and set the plates as they are pressed
; //also contains a link to the portcullis

BOOL PROPERTY plate1Down=FALSE AUTO
BOOL PROPERTY plate2Down=FALSE AUTO
BOOL PROPERTY plate3Down=FALSE AUTO
BOOL PROPERTY plate4Down=FALSE AUTO

OBJECTREFERENCE PROPERTY portDoor AUTO

