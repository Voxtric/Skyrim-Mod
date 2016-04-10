Scriptname DLC1VQ03VamprieCharmDexion extends ReferenceAlias  
{When the player uses a spel on Dexion that has the "vampiremesmerize" effect, display a new objective}

Event onHit(objectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetOwningQuest().GetStageDone(6) == 0
		if akAggressor == Game.GetPlayer() as ObjectReference
 			Spell sourceSpell = akSource as Spell
			If sourceSpell != None && GetActorRef().HasMagicEffect(VampireMesmerize)
				GetOwningQuest().SetObjectiveCompleted(40,1)
				GetOwningQuest().SetObjectiveDisplayed(45,1)
			endif
		endif
	endif
endEvent

MagicEffect Property VampireMesmerize  Auto 
