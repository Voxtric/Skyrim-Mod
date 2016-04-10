Scriptname dlc2DBSummonAncientSCRIPT extends ActiveMagicEffect  

OBJECTREFERENCE PROPERTY ancientDB AUTO
OBJECTREFERENCE PROPERTY ancientDBMarker AUTO
FLOAT PROPERTY waitTimer AUTO
FLOAT PROPERTY healthPCT AUTO

BOOL CANSPAWN=TRUE
ACTOR selfRef

EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster

ENDEVENT

EVENT ONHIT(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)  

	if(selfRef == game.getPlayer() && CANSPAWN && game.GetPlayer().GetAVPercentage("health") <= healthPCT && ancientDB.isEnabled() == FALSE)

		CANSPAWN = FALSE
		ancientDB.moveTo(game.getPlayer())
		ancientDB.enable()

		utility.wait(waitTimer)

		CANSPAWN = TRUE

	endif

ENDEVENT