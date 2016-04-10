Scriptname DLC2FlingStoneTriggerScript extends ObjectReference  


Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		DLC2FlingQuest_FlingRune.ForceRefTo(GetLinkedRef())
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		DLC2FlingQuest_FlingRune.Clear()
	endif	
EndEvent

ReferenceAlias Property DLC2FlingQuest_FlingRune Auto