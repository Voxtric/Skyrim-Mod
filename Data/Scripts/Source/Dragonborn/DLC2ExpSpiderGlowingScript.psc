Scriptname DLC2ExpSpiderGlowingScript extends Actor Hidden 

Spell Property SpellToCast Auto
Quest Property DLC2ExpSpiderQuest Auto
Bool Property bIsFriendly = FALSE Auto
Bool Property bAlreadyForcedRef = FALSE Auto Hidden
Explosion Property SpiderCrumbleExplosion Auto
{Explosion that comes from the spider when he dies without exploding}
Bool Property bAlreadyLoaded = FALSE Auto Hidden
Float Property SecondsAlive = 0.0 Auto Hidden

EVENT OnLoad()

	ObjectReference mySelf = self

	SpellToCast.Cast(self)

	if bIsFriendly
; 		debug.Trace("I'm a friendly spider, attempting to add myself to the list of spawned spiders" + self)
		if bAlreadyForcedRef == FALSE
; 			debug.Trace("bAlreadyForcedRef is FALSE, Forcing this ref!" + self)
			(DLC2ExpSpiderQuest as DLC2ExpGlowSpiderAliasArrayScript).ForceRefInto(mySelf)
			bAlreadyForcedRef = TRUE
		endif
	endif

	if (bAlreadyLoaded == FALSE)
		bAlreadyLoaded = TRUE
		CountdownToDeath()
	endif

EndEVENT


Function CountdownToDeath()
	While ((IsDead() == FALSE) && (SecondsAlive < 600))
		utility.Wait(1)
		SecondsAlive = SecondsAlive + 1
	EndWhile
	self.Kill()
EndFunction


Event OnDying(Actor akKiller)
	SpiderCrumble()
EndEvent


Function SpiderCrumble()
	PlaceAtMe(SpiderCrumbleExplosion, 1)
	self.SetAlpha(0)
	self.DisableNoWait()
	utility.Wait(1)
EndFunction