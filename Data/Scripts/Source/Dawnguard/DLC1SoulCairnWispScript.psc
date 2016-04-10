Scriptname DLC1SoulCairnWispScript extends Actor

import Debug
import Utility


MagicEffect Property DLC1PCVampireAbsorbHealthConcAimed  Auto  
MagicEffect Property DLC1SunDamageFFAimedArea  Auto  
MagicEffect Property DLC1SunDamageFFAimed Auto
MagicEffect Property DLC1PCVampireAbsorbHealthFFAimed Auto

Bool isWispDead = FALSE

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	;Notification("Effect Applies" + akeffect)
	;debug.trace("Effect Applies" + akeffect)
	;if ((akCaster == Game.GetPlayer()) && (akEffect == VampMagicEffect || akEffect == DawnguardMagicEffect))
	if (isWispDead == FALSE)
		;Notification("Wisp Is Not Dead")
		if (akEffect == DLC1SunDamageFFAimed || akEffect == DLC1SunDamageFFAimedArea)
			isWispDead = TRUE
			;getActorBase().SetInvulnerable(False)
			;Kill()
			Disable(TRUE)
			;Notification("DG Spell")
		elseif (akEffect == DLC1PCVampireAbsorbHealthConcAimed || akeffect == DLC1PCVampireAbsorbHealthFFAimed)
			isWispDead = TRUE
			;getActorBase().SetInvulnerable(False)
			;Kill()
			;wait(0.5)
			Disable(TRUE)
			;Notification("Vamp Spell")
		endif
	endif
endEvent
