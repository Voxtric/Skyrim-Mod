Scriptname DLC02SV01PlayerAtPuzzle02TrigSCRIPT extends ObjectReference Hidden 

Quest Property MyQuest Auto

Event OnTriggerEnter(objectReference triggerRef)

	(MyQuest as DLC2SV01ConditionsSCRIPT).bPlayerAtPuzzle02 = TRUE

EndEvent

Event OnTriggerLeave(objectReference triggerRef)

	(MyQuest as DLC2SV01ConditionsSCRIPT).bPlayerAtPuzzle02 = FALSE

EndEvent