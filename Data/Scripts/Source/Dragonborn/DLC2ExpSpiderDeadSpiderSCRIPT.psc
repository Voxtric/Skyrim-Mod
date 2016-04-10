Scriptname DLC2ExpSpiderDeadSpiderSCRIPT extends ObjectReference  
{For dead exploding spiders}

Explosion Property SpiderExplosion1 Auto
Explosion Property SpiderExplosion2 Auto
Explosion Property SpiderExplosion3 Auto
Explosion Property SpiderExplosion4 Auto
Explosion Property SpiderExplosion5 Auto
Explosion Property SpiderExplosion6 Auto
{Explosion that comes from the corpse}

Faction Property DLC2ExpSpiderEnemyFaction Auto
{Faction to check against if this bomb isn't friendly}

Bool Property bFriendlyBomb = TRUE Auto
{Default to TRUE: Keeps bomb from exploding for the player/teammates}

Bool bBlockExplosion = TRUE

Event OnLoad()
	utility.Wait(0.1)
	bBlockExplosion = FALSE
EndEvent

auto STATE WaitingForTrigger
	Event OnTriggerEnter(ObjectReference akActionRef)

		if (bFriendlyBomb == FALSE) && (!(akActionRef as Actor).IsInFaction(DLC2ExpSpiderEnemyFaction))
			if ((akActionRef as Actor).IsDead() == FALSE)
				GoToState("BeenTriggered")
				DoExplosion()
			endif
		endif

		if bFriendlyBomb == TRUE
			if (akActionRef as Actor)
				if ((akActionRef as Actor).IsDead() == FALSE)
					if (akActionRef as Actor).IsHostileToActor(Game.GetPlayer())
						GoToState("BeenTriggered")
						DoExplosion()
					endif
				endif
			endif
		endif
		
	EndEvent

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

		if ((akSource as Explosion) && !bBlockExplosion) || akProjectile
			GoToState("BeenTriggered")
			DoExplosion()
		endif

	EndEvent

EndSTATE


STATE BeenTriggered

EndSTATE


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