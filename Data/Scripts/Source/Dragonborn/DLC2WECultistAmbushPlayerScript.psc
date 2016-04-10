Scriptname DLC2WECultistAmbushPlayerScript extends ReferenceAlias  
{script on Player alias in DLC2CultistAmbush quest}

LocationAlias Property pLocation auto

ReferenceAlias Property Cultist1 auto
ReferenceAlias Property Cultist2 auto

int Property StageToStopPollingPlayerLocation auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	debug.trace(self + "OnLocationChange()" + akNewLoc)

	StopQuestIfNotInLocationAndCultistsNotLoaded()
EndEvent

Function StopQuestIfNotInLocationAndCultistsNotLoaded()
	while GetOwningQuest().GetStage() < StageToStopPollingPlayerLocation && GetActorReference().IsInLocation(pLocation.GetLocation()) == false
; 		debug.trace(self + "OnLocationChange() player is not in quest location. Will shut down if Cultists are not loaded..." + pLocation.GetLocation())	

		int waitingFor = 0
		bool checkAgain = false

		while Cultist1.GetReference().Is3DLoaded() || Cultist2.GetReference().Is3DLoaded()
			checkAgain = true
			utility.wait(1)
			waitingFor += 1
; 			debug.trace(self + "Cultists are still loaded, waiting until they unload. Waiting for: " + waitingFor)
		endwhile

		if checkAgain == false
			GetOwningQuest().Stop()
			return
		endif

	endwhile
EndFunction
