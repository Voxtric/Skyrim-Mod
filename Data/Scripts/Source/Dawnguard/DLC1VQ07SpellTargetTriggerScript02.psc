Scriptname DLC1VQ07SpellTargetTriggerScript02 extends ObjectReference  

ReferenceAlias Property pGeleborAlias Auto
Spell Property pMagelight Auto

;Using Magelight for now, get other spell as needed

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if AkSource == pMageLight
		if AkAggressor == pGeleborAlias.GetActorRef()
			pGeleborAlias.GetActorRef().EvaluatePackage()
			activate(self) ;wayshrine is activate parented to this trigger
			pDLC1VQ07.SetStage(70)
		endif
	endif

endEvent
Quest Property pDLC1VQ07  Auto  
