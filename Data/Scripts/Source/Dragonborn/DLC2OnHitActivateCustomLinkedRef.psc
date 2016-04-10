Scriptname DLC2OnHitActivateCustomLinkedRef extends ObjectReference  


Keyword Property LinkCustom01 auto
bool property doOnlyOnce = true auto

auto State Waiting
	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if doOnlyOnce
			goToState("Done")
		endif
		GetLinkedRef(LinkCustom01).activate(GetLinkedRef(LinkCustom01))
	endEvent

	event onActivate(objectReference akActivator)
		if doOnlyOnce
			goToState("Done")
		endif
		GetLinkedRef(LinkCustom01).activate(GetLinkedRef(LinkCustom01))
	endEvent

	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if doOnlyOnce
			goToState("Done")
		endif
		GetLinkedRef(LinkCustom01).activate(GetLinkedRef(LinkCustom01))
	endEvent
	
	event onGrab()
		if doOnlyOnce
			goToState("Done")
		endif
		GetLinkedRef(LinkCustom01).activate(GetLinkedRef(LinkCustom01))
	endEvent
endState

State Done

endState
