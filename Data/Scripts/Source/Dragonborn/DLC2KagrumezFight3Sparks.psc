Scriptname DLC2KagrumezFight3Sparks extends ObjectReference  

import utility

spell property sparks auto
ObjectReference property caster01 auto
ObjectReference property target01 auto
ObjectReference property caster02 auto
ObjectReference property target02 auto

bool property toggler = false auto hidden


function castspells()
	sparks.cast(caster01, target01)
	sparks.cast(caster02, target02)
endfunction

Auto State Waiting
	Event onActivate(ObjectReference Actronaut)
		if toggler == 0
	 		toggler = 1 
			castspells()
		elseif toggler == 1
			toggler = 0
			caster01.interruptcast()
			caster02.interruptcast()
 		endif
	EndEvent
EndState

state Buffer
endState