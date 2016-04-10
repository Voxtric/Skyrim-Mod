Scriptname DLC2Book02DungeonBridgeTrigger extends ObjectReference  

import utility

objectReference property bridge01 auto
;objectReference property bridge02 auto
;objectReference property bridge03 auto
objectReference property bridge04 auto

auto State Waiting
	Event onTrigger(objectReference Actronaut)
		if Actronaut == game.getplayer()
			wait(2)
			bridge01.activate(bridge01)
			bridge04.activate(bridge04)
			goToState("Buffer")
		endif
	EndEvent
EndState

state buffer
	Event onBeginState()
		wait(3)
		;bridge02.activate(bridge02)
		;bridge03.activate(bridge03)
		gotoState("Waiting")
	endEvent
endState



