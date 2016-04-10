Scriptname DLC1VQ07SpellTriggerScript extends ObjectReference  

ReferenceAlias Property pCasterAlias Auto
Spell Property pMagelight Auto
ObjectReference Property pActivatedShrine Auto

;Using Magelight for now, get other spell as needed

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if AkSource == pMageLight
		if AkAggressor == pCasterAlias.GetActorRef()
			pActivatedShrine.Activate(Self)
		endif
	endif

endEvent