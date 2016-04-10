Scriptname DLC2EncExplodingSpiderSCRIPT extends Actor Hidden 

Explosion Property SpiderExplosion1 Auto
Explosion Property SpiderExplosion2 Auto
Explosion Property SpiderExplosion3 Auto
Explosion Property SpiderExplosion4 Auto
Explosion Property SpiderExplosion5 Auto
Explosion Property SpiderExplosion6 Auto
{Explosion that comes from the spider when he explodes near you}

Explosion Property SpiderCrumbleExplosion Auto
{Explosion that comes from the spider when he dies without exploding}

Hazard Property SpiderExplosionHazard Auto
{Hazard taht gets placed once the spider explodes}

Bool Property bShouldExplode = TRUE Auto
{Whether or not this spider should explode (DEFAULT = TRUE)}

Int Property iElementalResist = 0 Auto
{Which element this spider resists, if any. 0 = Nothing (DEFAULT), 1 = FIRE, 2 = FROST, 3 = SHOCK}

Bool Property bShouldHandleOnHit = TRUE Auto
{Whether or not we should handle the OnHit() block. DEFAULT = TRUE}

Keyword Property MagicDamageFire Auto
Keyword Property MagicDamageFrost Auto
Keyword Property MagicDamageShock Auto


Bool bWasHit = FALSE 


	; Set the spiders scale and play the poison effect shader on it, also register for anim event so we know it's attacking
Event OnLoad()
; 	;debug.Trace("Spider running OnLoad()" + self)
	;self.SetAlpha(0)
	;self.SetScale(utility.RandomFloat(0.5, 0.6))
	;if GetCombatTarget()
	;	if (self.GetDistance(GetCombatTarget()) < 256)
	;		self.kill()
	;		;PlaceAtMe(SpiderExplosion, 1)
	;		self.DisableNoWait()
	;		self.DeleteWhenAble()
	;	endif
	;endif
	self.SetAlpha(1)
	RegisterForAnimationEvent(self, "MLh_SpellFire_Event")
	if (bShouldHandleOnHit)
		bShouldHandleOnHit = FALSE
		utility.wait(1)
		bShouldHandleOnHit = TRUE
	endif

EndEvent



	; When the spider attacks make it explode then clean it up
Event OnAnimationEvent(ObjectReference akSource, string EventName)
; 	;;debug.Trace("Spider running OnAnimationEvent()" + self)
	self.SetAlpha(0)
	((self as ObjectReference) as DLC2EncExpSpiderGenericControlSCRIPT).ClearActor()
	self.DisableNoWait()
	self.DeleteWhenAble()

endEVENT

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if bShouldHandleOnHit
		if (akSource as SPELL) && ((akSource as SPELL).IsHostile() == FALSE)
; 			;debug.Trace("Attack was Non-Hostile")
			;OnHit() was Non-Hostile
		elseif (akSource as SPELL)
; 			;debug.Trace("Attack WAS HOSTILE!")

			int iSpellType

			if (akSource as SPELL).HasKeyword(MagicDamageFire)
; 				;debug.Trace("Attack WAS FLAME!")
				iSpellType = 1
			elseif (akSource as SPELL).HasKeyword(MagicDamageFrost)
; 				;debug.Trace("Attack WAS FROST!")
				iSpellType = 2
			elseif (akSource as SPELL).HasKeyword(MagicDamageShock)
; 				;debug.Trace("Attack WAS SHOCK!")
				iSpellType = 3
			endif

			if (iElementalResist == 0) || (iSpellType != iElementalResist)
; 				;debug.Trace("Was NOT resistent to Attack!")
				bWasHit = TRUE
				self.Kill()
			else
; 				;debug.Trace("WAS resistant to Attack!")
			endif

		else
; 			;debug.Trace("I WAS HIT!")
			bWasHit = TRUE
			self.Kill()
		endif
	endif
EndEvent

	; Call function SpiderExplode() upon death
Event OnDying(Actor akKiller)
; 	;;debug.Trace("Spider running OnDying()" + self)
	if (bShouldExplode == TRUE) && (bWasHit == FALSE)
		SpiderExplode()
	else
		SpiderCrumble()		
	endif
	((self as ObjectReference) as DLC2EncExpSpiderGenericControlSCRIPT).ClearActor()
EndEvent



	; Handles the spider exploding
Function SpiderExplode()
; 	;;debug.Trace("Spider running SpiderExplode()" + self)

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

	if (SpiderExplosionHazard)
		self.PlaceAtMe(SpiderExplosionHazard, 1)
	endif
	self.SetAlpha(0)
	self.DisableNoWait()
	utility.Wait(1)

EndFunction

	; Handles the spider crumble on death
Function SpiderCrumble()
; 	;;debug.Trace("Spider running SpiderCrumble()" + self)
	PlaceAtMe(SpiderCrumbleExplosion, 1)
	self.SetAlpha(0)
	self.DisableNoWait()
	utility.Wait(1)
EndFunction


