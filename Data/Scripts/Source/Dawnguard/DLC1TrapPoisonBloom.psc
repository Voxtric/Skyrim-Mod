scriptName DLC1TrapPoisonBloom extends TrapTriggerBase
;
;
;
;================================================================

weapon property pressEffect auto
ammo property pressEffectAmmo auto
sound property warningSound auto
sound property releaseSound auto
int property mySoundInstance auto hidden
ingredient property myIngredient auto
miscObject property myMiscObject auto
potion property myPotion auto
string property openAnim = "Playanim02" auto
string property closeAnim = "Playanim01" auto
float property poisonReleaseDelay = 2.0 auto
{Delay between playing the animation and triggering the gas trap
	default = 2.0}


	
bool property waitingForWarnEnd = false auto hidden


State Active
	Event onBeginState()
		objectReference selfRef = self
		goToState( "DoNothing" )
		;pressEffect.fire(selfRef, pressEffectAmmo)
		; EFFECT IS HERE ^^^^^ UNCOMMENT ONCE PROJECTILES OR PARTICLES CAN LEAVE A TRIGGER BOX CORRECTLY
; 		debug.Trace(self + ": is calling onBeginState Active")
; 		debug.Trace(self + ": StoredTriggerType = " + StoredTriggerType + ", objectsInTrigger = " + objectsInTrigger)
		
		;/				Don't need any of this, as it was for the pressure plate
		if (StoredTriggerType == 1)
			Type = 3
			utility.wait(0.1)
			activate(self as objectReference)
			utility.wait(0.1)
			;Type = 1
		else
			activate(self as objectReference)
		endif
		;playAnimationAndWait( "trigger", "reset" )
		TriggerSound.play(self)
		playAnimation("Down")
		if objectsInTrigger == 0
			goToState( "Inactive" )
			playAnimation("Up")
		endif
		/;
		
		if warningSound
			mySoundInstance = warningSound.play(self)
		endif
		playAnimation("Warn")
		registerForAnimationEvent(self as objectReference, "End")
		waitingForWarnEnd = True
		registerForSingleUpdate(2.0)
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
; 		;debug.TRACE(self + " has been entered by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
; 		;debug.TRACE(self + " has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		if objectsInTrigger == 0
			goToState ("Reset")
			;playAnimation("Up")
			
		endif
	endEvent
endState

;/
event onReset()
	;playAnimation("ClosedIdle")
	;self.reset()
endEvent
/;

State Reset
	event onBeginState()
		unregisterForUpdate()
		waitForAnimationEvent("End")
		debug.Trace(self + ": anim event End recieved in state Active")
		sound.stopInstance(mySoundInstance)
		playAnimation("Reset")
		UnregisterForAnimationEvent(self as objectReference, "End")
		waitingForWarnEnd = false
		goToState("Inactive")
	endEvent
endState

State DoNothing			;Dummy state, don't do anything if animating
	event OnTriggerEnter( objectReference triggerRef )	
; 		debug.TRACE(self + " has been entered by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
	endEvent
	
	event OnTrigger( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
; 		debug.TRACE(self + " has been exited by " + triggerRef)
		objectsInTrigger = self.GetTriggerObjectCount()
		if objectsInTrigger == 0
			goToState ("Reset")
			;playAnimation("Up")
			
		endif
	endEvent
EndState

;State for the bloom having dispensed its gas
State done
	event onBeginState()
		self.setDestroyed()
	endEvent
	event onActivate(objectReference akActivator)
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
	endEvent
endState

;state for having been disarmed
state disarmed
	event onBeginState()
		;do stuff here if we need to swap the nif or something
		if waitingForWarnEnd
			waitForAnimationEvent("End")
		endif
		UnregisterForAnimationEvent(self as objectReference, "End")
		waitingForWarnEnd = false
		playAnimation("Picked")
		self.setDestroyed()
	endEvent
	
	event onActivate(objectReference akActivator)
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
	endEvent
endState

State Firing
	event onActivate(objectReference akActivator)
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
	endEvent
endState

;On Update if the objects in trigger is greater than 0 then it is time to trigger
event onUpdate()
	if objectsInTrigger > 0 && getState() != "disarmed"
		GoToState("Firing")
		waitForAnimationEvent("End")
		debug.Trace(self + ": anim event End recieved in onUpdate")
		UnregisterForAnimationEvent(self as objectReference, "End")
		waitingForWarnEnd = false

		sound.stopInstance(mySoundInstance)

		if releaseSound
			releaseSound.play(self)
		endif
		playAnimation("Explode")
		utility.wait(poisonReleaseDelay)
		self.activate(self, True);activate and ignore block activate
		goToState("done")
		
	elseif objectsInTrigger == 0
		playAnimation("Reset")
	endif
endEvent

;Override onActivate from TrapTriggerBase to allow harvest
event onActivate(objectReference akActivator)
; 	debug.Trace(self + " has been activated by + " + akActivator)
; 	debug.Trace(self + ": Type = " + Type + ", StoredTriggerType = " + StoredTriggerType)

	;If this is activated by an actor, disarm and give that actor an item
	if (akActivator as Actor)
		goToState("Disarmed")
		if myIngredient
			akActivator.addItem(myIngredient, 1)
		endif	
		
		if myMiscObject
			akActivator.addItem(myMiscObject, 1)
		endif	
		
		if myPotion
			akActivator.addItem(myPotion, 1)
		endif	
		
	elseif akActivator == (self as objectReference)
		if (akActivator as trapTriggerBase)
; 			debug.Trace(akActivator + " was able to be cast as trapTriggerBase")
; 			debug.Trace(self + " triggerType was " + triggerType)
			TriggerType = (akActivator as trapTriggerBase).TriggerType
; 			debug.Trace(self + " triggerType is now " + triggerType)
		
		
		else	
; 			debug.Trace(akActivator + " was NOT able to be cast as trapTriggerBase")
			triggerType = StoredTriggerType
		endif
		
		;/
		if blockActivate
			self.blockActivation(false)
			utility.wait(0.0)
			localActivateFunction()
			self.Activate(self)
			self.blockActivation(true)
		endif
		/;
		
	endif
endEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Added local function to check if the trigger object is another poison bloom or poison volume (trapBase or trapTriggerBase)
;			since they are often used in close proximity
bool function acceptableTrigger(objectReference triggerRef)

; 	debug.Trace(self + " is checking if " + triggerRef + " is an acceptable trigger")
	if playerOnlyTrigger
		if triggerRef == game.getPlayer()
; 			debug.Trace(self + " has found that " + triggerRef + " is an acceptable trigger")
			if checkPerks(triggerRef)
				Return True
			Else
				Return False
			endif
		Else
; 			debug.Trace(self + " has found that " + triggerRef + " is not an acceptable trigger")
			return False
		endif
	Else
		if triggerRef as TrapBase || triggerRef as TrapTriggerBase
			return False
		elseif !(triggerRef as actor)	;if this is not a player only trigger and this is not an actor
			return True
		elseif owningFaction
			if (triggerRef as actor).IsInFaction(owningFaction)
; 				debug.Trace(self + " has found that " + triggerRef + " is not an acceptable trigger")
				return False
			else
; 				debug.Trace(self + " has found that " + triggerRef + " is an acceptable trigger")
				if checkPerks(triggerRef)
					Return True
				Else
					Return False
				endif
			endif
		else
			if owningActorBase
				if (triggerRef as actor).getActorBase() == owningActorBase
; 					debug.Trace(self + " has found that " + triggerRef + " is not an acceptable trigger")
					return False
				Else
; 					debug.Trace(self + " has found that " + triggerRef + " is an acceptable trigger")
					if checkPerks(triggerRef)
						Return True
					Else
						Return False
					endif
				endif
			else
; 				debug.Trace(self + " has found that " + triggerRef + " is an acceptable trigger")
				if checkPerks(triggerRef)
					Return True
				Else
					Return False
				endif
			endif
		endif
	endif
endFunction
