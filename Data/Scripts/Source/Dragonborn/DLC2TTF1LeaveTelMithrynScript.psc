Scriptname DLC2TTF1LeaveTelMithrynScript extends ObjectReference  

Quest Property DLC2TTF1  Auto  
Quest Property DLC2MQ04  Auto  

Int Property StageToSet  Auto  
Int Property StageMin  Auto  
Int Property stageMax  Auto 
Int Property preReqStage  Auto 

bool OnlyOnce 

EVENT onTriggerEnter(objectReference akTriggerActor)
	if akTriggerActor == game.GetPlayer()
		if DLC2TTF1.GetStageDone(preReqStage) == true
			if DLC2MQ04.GetStage() < StageMin || DLC2MQ04.GetStage() >= StageMax
				DLC2TTF1.SetStage(StageToSet)
			endif
		endif

		if DLC2MQ01.GetStage() >= 30 && DLC2MQ04.IsRunning() == false && OnlyOnce == false
; 			debug.trace("TEL MITHRYN TRIGGER: moving Neloth")
			DLC2NelothRef.MoveTo(DLC2TT2NelothCastMarker)
			OnlyOnce = true
		endif
		
; 		debug.trace("TEL MITHRYN TRIGGER: Neloth at " + DLC2NelothRef.GetCurrentLocation() + " should be " + DLC2TelMithrynTowerLocation)
		if DLC2NelothRef.GetCurrentLocation() == DLC2TelMithrynTowerLocation
; 			debug.trace("TEL MITHRYN TRIGGER: unlocking")
			DLC2TelMithrynTowerDoorRef.Lock(false)
		endif
	endif
EndEvent

ObjectReference Property DLC2TelMithrynTowerDoorRef  Auto  

Location Property DLC2TelMithrynTowerLocation  Auto  

ObjectReference Property DLC2NelothRef  Auto  

Quest Property DLC2MQ01  Auto  

ObjectReference Property DLC2TT2NelothCastMarker  Auto  
