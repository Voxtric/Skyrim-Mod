Scriptname DLC2SV01PlayerAtPuzzle03TrigSCRIPT extends ObjectReference Hidden 

Quest Property MyQuest Auto

Event OnTriggerEnter(objectReference triggerRef)

	(MyQuest as DLC2SV01ConditionsSCRIPT).bPlayerAtPuzzle03 = TRUE

EndEvent

Event OnTriggerLeave(objectReference triggerRef)

	(MyQuest as DLC2SV01ConditionsSCRIPT).bPlayerAtPuzzle03 = FALSE

EndEvent