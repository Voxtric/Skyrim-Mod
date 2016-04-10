Scriptname DLC1_ReflectShieldSCRIPT extends ActiveMagicEffect  
{Script for reflecting shield to appear to reflect certain incoming spells.}

Actor selfRef
Spell  Property ChargeSpell1 Auto
Spell  Property ChargeSpell2 Auto
Spell  Property ChargeSpell3 Auto
Sound Property ChargSound Auto
ImagespaceModifier Property ChargeIMod Auto
ImagespaceModifier Property BlastIMod Auto
GlobalVariable Property TimesHit Auto
GlobalVariable Property CurrentStage Auto
Int Property HitsUntilFirstCharge = 5 Auto
{Hit's required until the shiled reaches it's first charge (DEFAULT = 5)}
Int Property HitsUntilSecondCharge = 10 Auto
{Hit's required until the shiled reaches it's first charge (DEFAULT = 10)}
Int Property HitsUntilThirdCharge = 15 Auto
{Hit's required until the shiled reaches it's first charge (DEFAULT = 15)}

EVENT OnEffectStart(Actor Target, Actor Caster)	
	selfRef = caster
	if (selfref == Game.GetPlayer())
		registerForAnimationEvent(selfRef, "bashRelease")
	else
		registerForAnimationEvent(selfRef, "bashExit")
		registerForAnimationEvent(selfRef, "bashStop")
	endif
	;debug.trace("Registering for Single Update")
	RegisterforSingleUpdate(0)

ENDEVENT


Event OnUpdate()
	;debug.trace("Updating once")
	if CurrentStage.GetValue() == 1
		;debug.Notification("Shield at LEVEL 1")
		selfRef.SetSubGraphFloatVariable("fDampRate", 1)
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.75)
	elseif CurrentStage.GetValue() == 2
		;debug.Notification("Shield at LEVEL 2")
		selfRef.SetSubGraphFloatVariable("fDampRate", 1)
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.85)
	elseif CurrentStage.GetValue() == 3
		;debug.Notification("Shield at LEVEL 3")
		selfRef.SetSubGraphFloatVariable("fDampRate", 1)
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 1)
	endif
EndEvent


EVENT OnEffectFinish(Actor Target, Actor Caster)	
	unregisterForAnimationEvent(selfRef, "bashRelease")
	unregisterForAnimationEvent(selfRef, "bashExit")
	unregisterForAnimationEvent(selfRef, "bashStop")
ENDEVENT


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

   	if abHitBlocked 

   		;debug.Trace("I've been hit in the SHIELD WHILE BLOCKING!")

   		TimesHit.SetValue(TimesHit.GetValue() + 1)

   		ChargSound.play(selfRef) 

   		if (TimesHit.GetValue() == HitsUntilFirstCharge)
   			;debug.Notification("Shield at LEVEL 1")
   			selfRef.SetSubGraphFloatVariable("fDampRate", 1)
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.75)
			if selfref == Game.GetPlayer()
				ChargeIMod.Apply()
			endif
   			CurrentStage.SetValue(1)
   		elseif (TimesHit.GetValue() == HitsUntilSecondCharge)
   			;debug.Notification("Shield at LEVEL 2")
   			selfRef.SetSubGraphFloatVariable("fDampRate", 1)
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.85)
			if selfref == Game.GetPlayer()
				ChargeIMod.Apply()
			endif
   			CurrentStage.SetValue(2)
   		elseif (TimesHit.GetValue() == HitsUntilThirdCharge)
   			;debug.Notification("Shield at LEVEL 3")
   			selfRef.SetSubGraphFloatVariable("fDampRate", 1)
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 1)
			if selfref == Game.GetPlayer()
				ChargeIMod.Apply()
			endif
   			CurrentStage.SetValue(3)
   		endif

   	else
   		;debug.Trace("I've been hit but NOT in the shield while blocking!")
   	endif

ENDEVENT
	

Event OnAnimationEvent(ObjectReference akSource, string EventName)
	
	if (selfref == Game.GetPlayer())
		if (eventName == "bashRelease")
			;debug.Trace("I'm catching the bashRelease anim event")
			if CurrentStage.GetValue() == 1
				BlastIMod.Apply(0.3)
				ChargeSpell1.cast(selfRef)
			elseif CurrentStage.GetValue() == 2
				BlastIMod.Apply(0.6)
				ChargeSpell2.cast(selfRef)	
			elseif CurrentStage.GetValue() == 3
				BlastIMod.Apply(1)
				ChargeSpell3.cast(selfRef)	
			endif	
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 0)
			CurrentStage.SetValue(0)
			TimesHit.SetValue(0)
			;debug.Notification("Shield at LEVEL 0")
		endif
	else
		if (eventName == "bashExit") || (eventName == "bashStop")
			;debug.Trace("I'm catching the bashRelease anim event")
			if CurrentStage.GetValue() == 1
				ChargeSpell1.cast(selfRef)
			elseif CurrentStage.GetValue() == 2
				ChargeSpell2.cast(selfRef)	
			elseif CurrentStage.GetValue() == 3
				ChargeSpell3.cast(selfRef)	
			endif	
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 0)
			CurrentStage.SetValue(0)
			TimesHit.SetValue(0)
			;debug.Notification("Shield at LEVEL 0")
		endif
	endif
		
endEVENT