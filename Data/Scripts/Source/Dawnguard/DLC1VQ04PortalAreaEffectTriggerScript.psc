Scriptname DLC1VQ04PortalAreaEffectTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ04  Auto  
; false = minimum damage
; true = maximum damage
BOOL PROPERTY maxDmg AUTO
EFFECTSHADER PROPERTY effect AUTO

INT INTRIGGER=0


EVENT ONTRIGGERENTER(objectreference ref)

	IF(ref as ACTOR == game.getPlayer())
		
		INTRIGGER += 1
		
		effect.play(game.getPlayer())
		
		while(INTRIGGER > 0)
			IF(maxDMG)
				game.getPlayer().damageAV("health", (game.getPlayer().getBaseAV("health") * 0.2))
				Game.ShakeController(0.5, 0.5, 0.3)
			ELSEIF(maxDMG == FALSE)
				game.getPlayer().damageAV("health", (game.getPlayer().getBaseAV("health") * 0.025))
				Game.ShakeController(0.5, 0.5, 0.3)	
			ENDIF
			
			utility.wait(0.5)
		endWHILE
		
		effect.stop(game.getPlayer())
	
	ENDIF

ENDEVENT


EVENT ONTRIGGERLEAVE(objectreference ref)

	IF(ref as ACTOR == game.getPlayer())
		INTRIGGER -= 1


		if pDLC1VQ04.GetStageDone(95) == 0
			pDLC1VQ04.SetStage(95)
		endif
		
	ENDIF

ENDEVENT