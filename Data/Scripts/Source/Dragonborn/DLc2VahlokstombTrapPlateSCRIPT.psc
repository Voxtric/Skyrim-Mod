Scriptname DLc2VahlokstombTrapPlateSCRIPT extends TrapFirePlate Hidden 

Int iActorsInTrigger

State Active
	Event onBeginState()
		goToState( "DoNothing" )
		if !weaponResolved
			ResolveLeveledHazard ()
		endif
		;pressEffect.fire(selfRef, pressEffectAmmo)
		; EFFECT IS HERE ^^^^^ UNCOMMENT ONCE PROJECTILES OR PARTICLES CAN LEAVE A TRIGGER BOX CORRECTLY
		activate(self as objectReference)
		;playAnimationAndWait( "trigger", "reset" )
		TriggerSound.play(self)
		playAnimation("Down")
		myHazardRef = PlaceAtMe(fireHazard, 1)
		if iActorsInTrigger == 0
			goToState( "Inactive" )
			playAnimation("Up")
			removeMyHazard()
		endif
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
		if (triggerRef as Actor)
; 			;debug.TRACE(self + " has been entered by " + triggerRef)
			iActorsInTrigger = iActorsInTrigger + 1
		endif
	endEvent
	
	event OnTrigger( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
		;if acceptableTrigger(triggerRef)
; 			;debug.TRACE(self + " has been exited by " + triggerRef)
			iActorsInTrigger = iActorsInTrigger - 1
			if iActorsInTrigger == 0
				goToState ("Inactive")
				playAnimation("Up")
				removeMyHazard()
			endif
		;endif
	endEvent
endState