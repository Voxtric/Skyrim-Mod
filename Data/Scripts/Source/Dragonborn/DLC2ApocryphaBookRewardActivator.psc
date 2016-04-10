Scriptname DLC2ApocryphaBookRewardActivator extends ObjectReference
{Script for the activators associated with the Reward Books. Just forwards the activation back to the book for handling.}

ObjectReference property Controller auto Hidden

Event OnInit()
	;Disable follower activation.
	Self.SetNoFavorAllowed(True)
EndEvent

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			GoToState("Busy")
			(Controller as DLC2ApocryphaBookRewardScript).ShowPowerPrompt(Self)
			GoToState("Waiting")
		EndIf
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState

Function SetController(ObjectReference newController)
	controller = newController
EndFunction