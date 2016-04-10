Scriptname DLC2KagrumezLightningScript extends ObjectReference  

import utility
spell property lightningspell auto 

objectReference property caster01 auto
objectReference property target01 auto
objectReference property caster02 auto
objectReference property target02 auto
objectReference property caster03 auto
objectReference property target03 auto
objectReference property caster04 auto
objectReference property target04 auto

int property casterID auto hidden

auto state casting
	Event onTrigger(objectReference Actronaut)
		casterID = (randomint(1, 3))
		if Actronaut == game.getPlayer()
			if casterID == 1
				lightningspell.cast(caster01, target01)
			elseif casterID == 2
				lightningspell.cast(caster02, target02)
			elseif casterID == 3
				lightningspell.cast(caster03, target03)
			elseif casterID == 4
				lightningspell.cast(caster04, target04)
			endif
			gotoState("buffer")	
		endif
	EndEvent
endState

state buffer
	Event onBeginState()
		wait(randomint(0, 3))
		gotoState("casting")
	endEvent
endState