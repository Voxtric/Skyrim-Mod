Scriptname DLC2SeekerMirrorScript extends Actor  

ActorBase Property DLC2EncSeekerMirror  Auto

Actor Mirror1
Actor Mirror2
Actor Mirror3
bool Mirrored
Int Property MirrorCount  Auto  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetActorValuePercentage("health") <= 0.5 && GetActorValue("health") > 0 && Mirrored == false
		Mirror1 = PlaceActorAtMe(DLC2EncSeekerMirror)
		if MirrorCount > 1
			Mirror2 = PlaceActorAtMe(DLC2EncSeekerMirror)
			if MirrorCount > 2
				Mirror3 = PlaceActorAtMe(DLC2EncSeekerMirror)
			endif
		endif
		Mirrored = true
	endif
EndEvent

Event OnDying(Actor akKiller)
	Mirror1.kill()
	Mirror2.kill()
	Mirror3.kill()
EndEvent
