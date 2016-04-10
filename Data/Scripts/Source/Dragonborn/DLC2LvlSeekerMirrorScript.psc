Scriptname DLC2LvlSeekerMirrorScript extends Actor  

SPELL Property DLC2Seeker01RightHandSpell  Auto  
SPELL Property DLC2Seeker02RightHandSpell  Auto  
SPELL Property DLC2Seeker03RightHandSpell  Auto  

ActorBase Property DLC2EncSeeker01Mirror  Auto
ActorBase Property DLC2EncSeeker02Mirror  Auto
ActorBase Property DLC2EncSeeker03Mirror  Auto

ActorBase MirrorBase
Actor Mirror1
Actor Mirror2
Actor Mirror3
bool Mirrored

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetActorValuePercentage("health") <= 0.5 && GetActorValue("health") > 0 && Mirrored == false
		if HasSpell(DLC2Seeker01RightHandSpell) == true
			MirrorBase = DLC2EncSeeker01Mirror
		elseif HasSpell(DLC2Seeker02RightHandSpell) == true
			MirrorBase = DLC2EncSeeker02Mirror
		elseif HasSpell(DLC2Seeker03RightHandSpell) == true
			MirrorBase = DLC2EncSeeker03Mirror
		endif

; 		debug.trace("SEEKER MIRROR SCRIPT: mirror base " + MirrorBase)
		Mirror1 = PlaceActorAtMe(Mirrorbase)
		if HasSpell(DLC2Seeker02RightHandSpell) == true
			Mirror2 = PlaceActorAtMe(MirrorBase)
		elseif HasSpell(DLC2Seeker03RightHandSpell) == true
			Mirror2 = PlaceActorAtMe(MirrorBase)
			Mirror3 = PlaceActorAtMe(MirrorBase)
		endif
		Mirrored = true
	endif
EndEvent

Event OnDying(Actor akKiller)
	Mirror1.kill()
	Mirror2.kill()
	Mirror3.kill()
EndEvent

