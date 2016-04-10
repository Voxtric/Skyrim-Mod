Scriptname DLC1PlayerBanished extends ReferenceAlias  
{Called on the player alias in DLC1VQ02 when the player refuses harkon's offer, and Harkon banishes the player from the castle}

Event onHit(objectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetOwningQuest().GetStageDone(20)
		if akAggressor == DLC1Harkonref as ObjectReference
 			Spell sourceSpell = akSource as Spell
			If sourceSpell != None && Game.GetPlayer().HasMagicEffect(BanishFFActor50)
				Game.GetPlayer().Moveto(DLC1VQ02PlayerWakeupMarkerReject)
			endif
		endif
	endif
endEvent

MagicEffect Property BanishFFActor50 auto
objectreference Property DLC1VQ02PlayerWakeupMarkerReject auto
objectreference Property DLC1Harkonref auto
