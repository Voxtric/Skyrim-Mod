Scriptname BYOHHouseBanditPacifierScript extends ReferenceAlias  

event OnLoad()
	GetActorRef().SetActorValue("Aggression", 1)
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
	if akAggressor == Game.GetPlayer()
		GetOwningQuest().Stop()
	endif
endEvent