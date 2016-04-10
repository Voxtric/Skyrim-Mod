Scriptname DLC2DweSteamMeterScript extends ObjectReference  
{This script controls the states of the steam meters in DLC2Fahlbtharz}



;This is the unpowered state
auto State Off
	Function FillMeter()
		playAnimationAndWait("Trigger01", "Done")
		GoToState("On")
	endFunction
endState

;This is the powered state
state On
	Function FillMeter()
		playAnimationAndWait("Trigger02", "Done")
		GoToState("Overload")
	endFunction

	Function EmptyMeter()
		playAnimation("Off");AndWait("Off", "Done")
		GoToState("Off")
	endFunction
endState

;This is the overpowered state
state Overload
	Function EmptyMeter()
		playAnimation("Trigger01");AndWait("Trigger02", "Done")
		GoToState("On")
	endFunction
endState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function FillMeter()
endFunction

Function EmptyMeter()
endFunction