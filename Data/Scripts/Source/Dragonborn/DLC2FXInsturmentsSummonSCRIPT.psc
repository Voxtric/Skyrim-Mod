Scriptname DLC2FXInsturmentsSummonSCRIPT extends ActiveMagicEffect conditional
{moves the instruments actor to player on effect start and moves actor back to holding cell on effect end}

import utility
import debug

ObjectReference property myMarker auto
ObjectReference property myBard auto
Activator property myFX Auto
Quest property myQuest auto
MagicEffect property myMagicEffect auto
Spell property myBardSpell auto
sound property IntroSoundFX auto
sound property OutroSoundFX auto

;******************************************************

Event OnEffectStart(Actor Target, Actor Caster)
	(myBard as actor).StopCombat()
	
	if(IntroSoundFX)
		IntroSoundFX.play((target as objectReference))
	endif
	myBard.enable()
	myBard.moveTo(game.GetPlayer())
	myQuest.setStage(500)
	wait(2)
	myBardSpell.Cast(myBard as actor)
endEvent

;******************************************************

Event OnEffectFinish(Actor Target, Actor Caster)
	if(game.getPlayer().HasMagicEffect(myMagicEffect))
		;bard is already there, no need to disable
	else
		(myBard as Actor).PlaySubGraphAnimation("stopeffect")
		if(OutroSoundFX)
			OutroSoundFX.play((target as objectReference))
		endif
		wait(0.5)
		myBard.MoveTo(myMarker)
		(myBard as actor).StopCombat()
		myQuest.setStage(600)
	endif
endEvent
	
;******************************************************