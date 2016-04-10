Scriptname DLC2ExpSpiderOilSCRIPT extends ObjectReference Hidden 

import utility
import debug

Activator Property OilPool Auto
Float Property fTimeBetweenPlacement = 0.7 Auto

Keyword Property MagicDamageFire Auto
Explosion Property DLC2ExpSpiderOilCrumbleExplosion Auto

Explosion Property SpiderExplosion1 Auto
Explosion Property SpiderExplosion2 Auto
Explosion Property SpiderExplosion3 Auto
Explosion Property SpiderExplosion4 Auto
Explosion Property SpiderExplosion5 Auto
Explosion Property SpiderExplosion6 Auto

Explosion Property TrapOilExplosion01 Auto

Bool bPlaceOil

ObjectReference mySelf


Event OnLoad()

	mySelf = self

	if (mySelf as Actor).IsDead() == FALSE
		bPlaceOil = TRUE
		DropOilPools()
	endif

EndEvent


Event OnCellDetach()
	bPlaceOil = FALSE
EndEvent


Event OnDying()
	bPlaceOil = FALSE
	SpiderCrumble()
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	debug.trace("akAggressor is " + akAggressor + ".  akSource is " + akSource + ".  akProjectile is " + akProjectile)

; 	debug.Trace("I was hit!")
	if (akSource as SPELL)
; 		debug.Trace("It was a SPELL!")
		if (akSource as SPELL).HasKeyword(MagicDamageFire)
; 			debug.Trace("It was a FIRE SPELL")
			bPlaceOil = FALSE
			DoExplosion()
			SpiderCrumble()
		endif
	endif
	if (akSource as EXPLOSION)
; 		debug.Trace("It was an EXPLOSION!")
		if (akSource as EXPLOSION) == TrapOilExplosion01
; 			debug.Trace("It was a TrapOilExplosion01 EXPLOSION")
			bPlaceOil = FALSE
			DoExplosion()
			SpiderCrumble()
		endif
	endif
EndEvent

Function DropOilPools()
	While(bPlaceOil)
		if (mySelf as Actor).IsDead() == 0
			if ((mySelf as Actor).IsInCombat())
				ObjectReference OilPoolRef = PlaceAtMe(OilPool, 1, false, false)
				;trace("Placing oil pool")
				;trace("Setting angles on " + OilPoolRef)
				OilPoolRef.SetAngle(0,0,0)
				;trace("X = " + OilPoolRef.GetAngleX() + ", Y = " + OilPoolRef.GetAngleY() + ", Z = " + OilPoolRef.GetAngleZ())
				;OilPoolRef.Enable(1)
			endif
		else
			bPlaceOil = FALSE
		endif
		wait(fTimeBetweenPlacement)
	EndWhile
EndFunction

Function SpiderCrumble()
; 	;debug.Trace("Spider running SpiderCrumble()" + self)
	PlaceAtMe(DLC2ExpSpiderOilCrumbleExplosion, 1)
	self.DisableNoWait()
	utility.Wait(1)
EndFunction

Function DoExplosion()
	if Game.GetPlayer().GetLevel() < 10
		PlaceAtMe(SpiderExplosion1, 1)
	elseif Game.GetPlayer().GetLevel() < 20
		PlaceAtMe(SpiderExplosion2, 1)
	elseif Game.GetPlayer().GetLevel() < 30
		PlaceAtMe(SpiderExplosion3, 1)
	elseif Game.GetPlayer().GetLevel() < 40
		PlaceAtMe(SpiderExplosion4, 1)
	elseif Game.GetPlayer().GetLevel() < 50
		PlaceAtMe(SpiderExplosion5, 1)
	elseif Game.GetPlayer().GetLevel() >= 50
		PlaceAtMe(SpiderExplosion6, 1)
	endif
	self.DisableNoWait()
EndFunction