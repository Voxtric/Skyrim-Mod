Scriptname DLC1VQ07SpellTargetTriggerScript extends ObjectReference  

ReferenceAlias Property pGeleborAlias Auto
Spell Property pMagelight Auto

;Using Magelight for now, get other spell as needed

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if AkSource == pMageLight
		if AkAggressor == pGeleborAlias.GetActorRef()
			pDLC1VQ07GeleborSceneGate.SetValue(1)
			pDLC1VQ07Waygate01Ref.Activate(Self)
		endif
	endif

endEvent
GlobalVariable Property pDLC1VQ07GeleborSceneGate  Auto  

ObjectReference Property pDLC1VQ07Waygate01Ref  Auto  
