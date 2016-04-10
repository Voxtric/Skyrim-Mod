Scriptname DLC2SV01PlayerAHOSTrigSCRIPT extends ObjectReference Hidden 

Quest Property MyQuest Auto

Event OnTriggerEnter(objectReference triggerRef)

	(MyQuest as DLC2SV01ConditionsSCRIPT).bPlayerAtHOS = TRUE

EndEvent

Event OnTriggerLeave(objectReference triggerRef)

	(MyQuest as DLC2SV01ConditionsSCRIPT).bPlayerAtHOS = FALSE

EndEvent
