Scriptname DLC1SoulCairnWispWallCHILDScript extends Actor  
import Debug
import Utility


MagicEffect Property DLC1PCVampireAbsorbHealthConcAimed  Auto  
MagicEffect Property DLC1SunDamageFFAimedArea  Auto  
MagicEffect Property DLC1SunDamageFFAimed Auto
MagicEffect Property DLC1PCVampireAbsorbHealthFFAimed Auto

Keyword Property DLC1WispWall auto 

ObjectReference WispWall

Bool isWispDead = FALSE
Bool isCounted = FALSE

Event OnCellAttach()
	WispWall = GetLinkedRef(DLC1WispWall)
	if (isCounted == FALSE)
		isCounted = TRUE
		(WispWall as DLC1SCWispWallScript).GetWispNumber()
	endif
endEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	;Notification("Effect Applies" + akeffect)
	;debug.trace("Effect Applies" + akeffect)
	;if ((akCaster == Game.GetPlayer()) && (akEffect == VampMagicEffect || akEffect == DawnguardMagicEffect))
	if (isWispDead == FALSE)
	;	Notification("Wisp Is Not Dead")
		if (akEffect == DLC1SunDamageFFAimed || akEffect == DLC1SunDamageFFAimedArea)
			isWispDead = TRUE
			;getActorBase().SetInvulnerable(False)
			;Kill()
			Disable(TRUE)
			(WispWall as DLC1SCWispWallScript).CheckDead()
			;Notification("DG Spell")
		elseif (akEffect == DLC1PCVampireAbsorbHealthConcAimed || akeffect == DLC1PCVampireAbsorbHealthFFAimed)
			isWispDead = TRUE
			;getActorBase().SetInvulnerable(False)
			;Kill()
			;wait(0.5)
			Disable(TRUE)
			(WispWall as DLC1SCWispWallScript).CheckDead()
	;		Notification("Vamp Spell")
		endif
	endif
endEvent
