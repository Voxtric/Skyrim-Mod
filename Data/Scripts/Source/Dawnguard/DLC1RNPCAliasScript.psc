Scriptname DLC1RNPCAliasScript extends ReferenceAlias  


Event OnUpdateGameTime()
	if GetActorRef().GetAV("WaitingforPlayer") == 0
		UnRegisterForUpdateGameTime()
	else
		Debug.Trace("RNPC: Done waiting...")
		(GetOwningQuest() as DLC1_NPCMentalModelScript).FinishWaiting()
		UnRegisterForUpdateGameTime()
	endif	
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	GoToState("CheckingOutfit")
	(GetOwningQuest() as DLC1_NPCMentalModelScript).CheckOutfit()
	GoToState("")
EndEvent


State CheckingOutfit
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		; do nothing
	EndEvent
EndState
