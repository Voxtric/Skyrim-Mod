Scriptname dlc2MKMiraakRobeAbilityEffectSCRIPT extends ActiveMagicEffect

EXPLOSION PROPERTY tentacleExplosion AUTO
FLOAT PROPERTY waitTimer AUTO

bool CANEXPLODE=TRUE

EVENT ONHIT(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)  

	if(CANEXPLODE)
; 		debug.trace("this one's gonna be a hit")
		game.getPlayer().placeAtMe(tentacleExplosion)
		CANEXPLODE = FALSE

		utility.wait(waitTimer)

		CANEXPLODE = TRUE

	endif

ENDEVENT