Scriptname DLC2BloodskalbladeScript extends referenceAlias

Actor property selfRef auto hidden
Spell Property DLC2BloodskalBladeSpellHoriz auto
Spell Property DLC2BloodskalBladeSpellVert auto
weapon property selfWeapon auto hidden hidden
ammo property DLC2BloodskalAmmo auto
ReferenceAlias Property BloodskalBlade auto
objectReference Property ObjSelf auto hidden


Event OnEquipped(Actor akActor)
	
	;objSelf = self.getReference()
; 	debug.trace(self + " has recieved OnEquipped")
	selfRef = akActor
; 	;debug.Trace("SelfRef = " + SelfRef)
	if (selfref == Game.GetPlayer())
		;registerForAnimationEvent(selfRef, "PowerAttack_Start_End")
		registerForAnimationEvent(akActor, "AttackPowerStanding_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerRight_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerLeft_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerBackward_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerForward_FXstart")
	else
		;registerForAnimationEvent(selfRef, "PowerAttack_Start_End")
		registerForAnimationEvent(akActor, "AttackPowerStanding_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerRight_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerLeft_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerBackward_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerForward_FXstart")
	endif
; 	;debug.trace("Registering for Single Update")

	;RegisterforSingleUpdate(0)
endEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer as Actor
		selfWeapon = (self.getReference().getBaseObject() as weapon)
		utility.wait(0.1)
		if (akNewContainer as Actor).isEquipped(selfWeapon)
			OnEquipped(akNewContainer as Actor)
		endif
	endif
	BloodskalBlade.ForceRefTo(objSelf)
endEvent

Event OnUnequipped(Actor akActor)
; 	debug.trace(self + " has recieved onEffectFinish")
	;unregisterForAnimationEvent(selfRef, "PowerAttack_Start_End")
	unregisterForAnimationEvent(akActor, "AttackPowerStanding_FXstart")
	unregisterForAnimationEvent(akActor, "AttackPowerRight_FXstart")
	unregisterForAnimationEvent(akActor, "AttackPowerLeft_FXstart")
	unregisterForAnimationEvent(akActor, "AttackPowerBackward_FXstart")
	unregisterForAnimationEvent(akActor, "AttackPowerForward_FXstart")
ENDEVENT

Event OnAnimationEvent(ObjectReference akSource, string EventName)
; 	debug.trace(self + " has recieved AnimationEvent ")
; 	debug.trace(">>>>>>>>>>>>> AnimationEvent Name: " + EventName)
; 	debug.trace(">>>>>>>>>>>>> AkSource: " + akSource)
	if (selfref == Game.GetPlayer())
		if (eventName == "AttackPowerRight_FXstart") || \
			(eventName == "AttackPowerLeft_FXstart") || \
			(eventName == "AttackPowerBackward_FXstart")
			weapon SwordWeapon = selfRef.GetEquippedWeapon()
			DLC2BloodskalBladeSpellHoriz.cast(selfRef)

		elseif  (eventName == "AttackPowerStanding_FXstart") || \
				(eventName == "AttackPowerForward_FXstart")
			weapon SwordWeapon = selfRef.GetEquippedWeapon()
			DLC2BloodskalBladeSpellVert.cast(selfRef)
		endif
	endif
		
endEVENT