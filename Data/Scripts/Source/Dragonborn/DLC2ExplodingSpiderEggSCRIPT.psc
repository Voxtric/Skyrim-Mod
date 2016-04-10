Scriptname DLC2ExplodingSpiderEggSCRIPT extends ObjectReference Hidden 

ActorBase Property SpideToSpawn Auto
{Spider to place at this egg on explosion}
Explosion Property MyExplosion Auto
{Spider to place at this egg on explosion}
Faction Property DLC2ExpSpiderEnemyFaction Auto
{Faction to check for before exploding}
Int Property AmountToSpawn = 1 Auto
{(DEFAULT = 1) How many spiders this egg should spawn(Max is 3), 0 = Random between 1 and 3}

Bool bPlayerInTrigger


Event OnLoad()
; 	debug.Trace("Egg running OnLoad()" + self)
	
EndEvent


auto STATE WaitingToExplode

	Event OnTriggerEnter(ObjectReference akActionRef)
; 		debug.Trace("Something entered the trigger" + self)
			;If non-sneaking actor triggers egg then explode
		if (akActionRef as Actor)
; 			debug.Trace("It's an actor" + self)
			if (akActionRef != Game.GetPlayer())
				if  (akActionRef as Actor).IsSneaking()
; 					debug.Trace("Actor is sneaking" + self)
					;Don't do anything
				else
; 					debug.Trace("Actor is NOT sneaking, so BOOM" + self)
					if ((akActionRef as actor).IsInFaction(DLC2ExpSpiderEnemyFaction))
						;Do Nothing
					else
						ExplodeEgg()
					endif
				endif
			endif
		endif
			; If triggered by player, loop to see if he's sneaking until he leaves.  If he's not sneaking then explode
		if(akActionRef == Game.GetPlayer())
; 			debug.Trace("Actor is PLAYER" + self)
			if !Game.GetPlayer().IsSneaking()
; 				debug.Trace("Player is NOT sneaking" + self)
				ExplodeEgg()
			else
; 				debug.Trace("Player is sneaking, watch him!" + self)
				bPlayerInTrigger = TRUE
				WatchPlayer()
			endif
		endif
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
		if (akActionRef == Game.GetPlayer())
; 			debug.Trace("Player left trigger" + self)
			bPlayerInTrigger = FALSE
		endif
	EndEvent
	
	
		; If it's hit then make it explode and spawn the spiders
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

		ExplodeEgg()

	EndEvent

ENDSTATE


STATE Done

	Event OnBeginState()
; 		debug.Trace("Egg in Done State" + self)
	EndEvent

ENDSTATE


Function WatchPlayer()
	While (bPlayerInTrigger == TRUE) && (self.isDisabled() == FALSE)
; 		debug.Trace("LOOP - Running 'WatchPlayer()'' loop" + self)
		if Game.GetPlayer().IsSneaking()
; 			debug.Trace("LOOP - Player is sneaking" + self)
			;Do Nothing
		else
; 			debug.Trace("LOOP - Player is NOT sneaking" + self)
			if (bPlayerInTrigger == TRUE)
; 				debug.Trace("LOOP - BOOM" + self)
				ExplodeEgg()
			endif
		endif
		utility.Wait(0.5)
	EndWhile
EndFunction


Function ExplodeEgg()

	GoToState("Done")

	ObjectReference CurrentSpider


	PlaceAtMe(MyExplosion)

	if (AmountToSpawn == 0)
		AmountToSpawn = utility.RandomInt(1, 3)
	endif

	if (AmountToSpawn >= 1)
		CurrentSpider = self.PlaceAtMe(SpideToSpawn, 1)
		;(CurrentSpider as Actor).SetAlpha(0)
		CurrentSpider.MoveToNode(self, "SpiderLoc01")
	endif

	if (AmountToSpawn >= 2)
		CurrentSpider = self.PlaceAtMe(SpideToSpawn, 1)
		;(CurrentSpider as Actor).SetAlpha(0)
		CurrentSpider.MoveToNode(self, "SpiderLoc02")
	endif

	if (AmountToSpawn >= 3)
		CurrentSpider = self.PlaceAtMe(SpideToSpawn, 1)
		;(CurrentSpider as Actor).SetAlpha(0)
		CurrentSpider.MoveToNode(self, "SpiderLoc03")
	endif

	;self.DeleteWhenAble()
	self.DisableNoWait()
	CurrentSpider = NONE
	AmountToSpawn = 0
	self.Delete()

EndFunction