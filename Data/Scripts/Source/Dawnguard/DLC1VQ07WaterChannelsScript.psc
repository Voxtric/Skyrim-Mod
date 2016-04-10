Scriptname DLC1VQ07WaterChannelsScript extends ObjectReference  

ObjectReference Property pDLC1TempleDoorLightLowerRef Auto
ObjectReference Property pDLC1TempleDoorLightUpperRef Auto
ObjectReference Property pDLC1VQ07DoorToTempleRef Auto
Quest Property pDLC1VQ07 Auto

Function EventStaging()

;Listen for BeamStart (enable lights)
;Listen for Door (enable Door)
;Listen for BeamEnd (Disable Lights)
registerForAnimationEvent(Self, "Beamstart")
registerForAnimationEvent(Self, "Door")
registerForAnimationEvent(Self, "Beamend")
Self.PlayAnimation("waterstart")

endFunction

Event OnAnimationEvent(ObjectReference akSource, string EventName)
                
	if (EventName == "Beamstart")
		pDLC1TempleDoorLightLowerRef.EnableNoWait()
		pDLC1TempleDoorLightUpperRef.EnableNoWait()
	endif

	if (EventName == "Door")
		pDLC1VQ07DoorToTempleRef.PlayGamebryoAnimation("Forward")
	endif

	if (EventName == "Beamend")
		pDLC1VQ07DoorToTempleRef.Lock(false)
		pDLC1VQ07.SetStage(110)
		pDLC1TempleDoorLightLowerRef.DisableNoWait()
		pDLC1TempleDoorLightUpperRef.DisableNoWait()
	endif
      
endEVENT
