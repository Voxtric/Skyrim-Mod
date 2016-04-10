Scriptname DLC2DisableOnLoadAfterWait extends ObjectReference  

Auto State ReadyToDisable
	Event OnLoad()
		GoToState("Done")
		Utility.Wait(1)
		Self.Disable()
	EndEvent
EndState

State Done
	Event OnLoad()
		;Do nothing.
	EndEvent
EndState