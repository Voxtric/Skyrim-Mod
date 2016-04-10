Scriptname DLC01SoulCairnCratterScript extends ObjectReference  

;spell property MagickaBoostSpell auto

float property fFadeSpeed auto
float property fUnfadeSpeed auto
float property fDelay auto

Keyword Property LinkCustom02 auto

int Property healthRegenAmount Auto

EffectShader Property HealFXS Auto

objectReference myLightRef 
bool bReady = TRUE

	EVENT onTriggerEnter(objectReference akActor)
		; only cast if ready.
		myLightRef = GetLinkedRef(LinkCustom02)
		if (bReady == TRUE && akActor == game.GetPlayer()) 
			bReady = FALSE
			game.GetPlayer().restoreAV("health", healthRegenAmount)
			HealFXS.Play(akActor, 2.5)
			float originalZpos = getLinkedRef().z
			getLinkedRef().translateTo(getLinkedRef().x, getLinkedRef().y, getLinkedRef().z - 500, getLinkedRef().getAngleX(),getLinkedRef().getAngleY(), (getLinkedRef().getAngleZ()+180),fFadeSpeed,fFadeSpeed)
			myLightRef.translateTo(myLightRef.x, myLightRef.y, myLightRef.z - 500, myLightRef.getAngleX(),myLightRef.getAngleY(), myLightRef.getAngleZ(),fFadeSpeed)
			utility.wait(fDelay)
			getLinkedRef().translateTo(getLinkedRef().x, getLinkedRef().y, originalZpos, getLinkedRef().getAngleX(),getLinkedRef().getAngleY(), getLinkedRef().getAngleZ(),fUnfadeSpeed,fUnfadeSpeed)
			myLightRef.translateTo(myLightRef.x, myLightRef.y, myLightRef.z + 500, myLightRef.getAngleX(),myLightRef.getAngleY(), myLightRef.getAngleZ(),fUnfadeSpeed)
			; brute force - wait however long "feels" right for it to come back.
			utility.wait(5.0)
			bReady = TRUE
		endif
	endEVENT
