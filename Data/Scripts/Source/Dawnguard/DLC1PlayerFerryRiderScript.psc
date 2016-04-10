Scriptname DLC1PlayerFerryRiderScript extends ReferenceAlias  
{ watch for player to sit in carriage}

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
; 		debug.trace(self + " OnActivate " + akActionRef)
		FerrySystemScript FerryScript = GetowningQuest() as FerrySystemScript
		Clear()
		FerryScript.PlayerIsSitting()
	endif
endEvent

event OnUnload()
; 	debug.trace(self + " current carriage unloading - clear waiting state")
	FerrySystemScript FerryScript = GetowningQuest() as FerrySystemScript
	FerryScript.ClearWaitingState()
endEvent
