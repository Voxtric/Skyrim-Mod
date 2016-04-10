Scriptname DLC2dunBloodskalDisableDraugrScript extends Actor  
{This scripts makes it so that after the actor dies and the cell resets it will disable itself}

Quest Property DLC2RR03 auto

Auto State Waiting
	Event OnDeath(Actor akKiller)
		GoToState("Dead")
	EndEvent

	Event OnReset()
		if DLC2RR03.getStage() >= 50 || DLC2RR03.isCompleted()
			GoToState("Dead")
			Self.Disable()
		Endif
	EndEvent

	Event OnCellAttach()
		if DLC2RR03.isCompleted()
			GoToState("Dead")
			Self.Disable()
		Endif
	EndEvent
endState

State Dead
	Event onReset()
		if DLC2RR03.getStage() >= 50 || DLC2RR03.isCompleted()
			Self.Disable()
		Endif
	EndEvent
EndState
