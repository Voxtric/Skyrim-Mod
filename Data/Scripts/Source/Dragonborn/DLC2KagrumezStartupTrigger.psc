Scriptname DLC2KagrumezStartupTrigger extends ObjectReference  

import quest

quest property DLC2KagrumezQST auto 

auto State Waiting
	Event onTriggerEnter(objectReference Actronaut)
			if DLC2KagrumezQST.isRunning() == 0
				DLC2KagrumezQST.setstage(0)
			endif
			gotoState("Done")
			self.disable()
	endEvent
endState

State Done
;do nothing
EndState