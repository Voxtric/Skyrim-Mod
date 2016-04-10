Scriptname DLC1BatsEffectScript extends ActiveMagicEffect  

;phil's radiant rewards
SPELL PROPERTY amuletSpell AUTO
GLOBALVARIABLE PROPERTY batAmulet AUTO

Idle Property BatSprintStart  Auto  
GlobalVariable Property DLC1VampireLevitateStateGlobal Auto
Activator Property DLC1VampLordBatsFXActivator Auto
spell Property DLC1VampireBats auto
float Property fReformDelay = 0.0 auto
{This will delay the reformation animation effect.}
float Property fSpellEndDelay = 0.0 auto
{This will delay the reformation animation effect.}
EffectShader property DLC1VampireBatsReformFXS auto
{main Effect Shader for spell}
EffectShader property DLC1VampireBatsReformBATSFXS auto
{2nd Effect Shader for spell}

DLC1PlayerVampireChangeScript Property DLC1PlayerVampireQuest auto
{ so we can tell vampire script when bat effect starts }

ImageSpaceModifier Property CastingImod Auto
{We set the imod here so we can limit it to only play if the spell works}

float fLevStateStartValue = 0.0
ObjectReference MyBatsFXObjectRef = None
bool bBatsLoopContinue = true
actor CasterActor
Float fTranslationSpeed = 512.0
bool bBatsAreGoCheck = False
string BatSprintOff = "BatSprintOff"
Bool bAnimDidHappen = False

Event OnEffectStart(Actor akTarget, Actor akCaster)
	CasterActor = akCaster

; We need to store the current variable so we can put it back later, if we have to.
	fLevStateStartValue = DLC1VampireLevitateStateGlobal.GetValue()

	; Register for the anim event so we can tell when we are done moving.
 	RegisterForAnimationEvent(CasterActor,BatSprintOff)

 	; save out player's currently equipped spell
	DLC1PlayerVampireQuest.CurrentEquippedLeftSpell = CasterActor.GetEquippedSpell(0) 	

; Animate the bat sprint animation.  Test this to see if we have to run the rest of the visuals.
	if CasterActor.PlayIdle(BatSprintStart)
		bBatsAreGoCheck = true
		CastingImod.Apply()

	; Make player turn invisible and throw away attached arrows.
		CasterActor.SetSubGraphFloatVariable("fdampRate", 0.20) ;;speeds up fade rate (max 1 min .1
		CasterActor.SetSubGraphFloatVariable("ftoggleBlend", 1.3) ;;blends between two anims default 0 (0 = there 1 = gone)
		CasterActor.ClearExtraArrows()

		;phil's check to upgrade BATS
		if (batAmulet.getValue() == 1)
			amuletSpell.cast(CasterActor, CasterActor)
		endif

	; Spawn Bats effect objects and make sure it is visible. Then give it it's first translation update.
		MyBatsFXObjectRef = (CasterActor.placeatme(DLC1VampLordBatsFXActivator))
		MyBatsFXObjectRef.EnableNoWait(false)
		MyBatsFXObjectRef.TranslateToRef(CasterActor,fTranslationSpeed,1)

	;We want to turn off the glow effect on the Vampire Lord if it is running while he uses BATS.  Then we want to put it back.
		if fLevStateStartValue == 2.0
			DLC1VampireLevitateStateGlobal.setvalue(3.0)  ; We set this to 3.0 only here, so we can tell later if the state is unchanged.
		endif
		BattyLoops()
	endif
EndEvent

; This function is for moving the bats effect to chase after the player.  It may not be needed anymore.
Function BattyLoops()
	while bBatsLoopContinue
		CasterActor.GetDistance(MyBatsFXObjectRef)
		MyBatsFXObjectRef.TranslateToRef(CasterActor,(CasterActor.GetDistance(MyBatsFXObjectRef) + fTranslationSpeed),1)
		utility.wait(0.2)
	endwhile

	MyBatsFXObjectRef.TranslateToRef(CasterActor,fTranslationSpeed,1)
	utility.wait(0.25)
	MyBatsFXObjectRef.disable()
	MyBatsFXObjectRef.Delete()
	MyBatsFXObjectRef = None

endfunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == BatSprintOff
		UnRegisterForAnimationEvent(CasterActor,BatSprintOff)
		bAnimDidHappen = true

		utility.wait(fReformDelay)
		CasterActor.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
		CasterActor.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)

		;phil is removing the spell here
		if(batAmulet.getValue() == 1)
			CasterActor.removeSpell(amuletSpell)
			CasterActor.dispelSpell(amuletSpell)
		endif

		; We test this again, just in case the player exited floating mode during the Bats effect.  If it is still 3.0, then they did not.
		if DLC1VampireLevitateStateGlobal.GetValue() == 3.0
			DLC1VampireLevitateStateGlobal.setvalue(fLevStateStartValue)
		endif

		DLC1VampireBatsReformFXS.Play(CasterActor,0.2)
		DLC1VampireBatsReformBATSFXS.Play(CasterActor,0.2)

		utility.wait(fSpellEndDelay)

		CasterActor.DispelSpell(DLC1VampireBats)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if bBatsAreGoCheck
		if bAnimDidHappen == false
			UnRegisterForAnimationEvent(CasterActor,BatSprintOff)
			CasterActor.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
			CasterActor.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)
			DLC1VampireBatsReformFXS.Play(CasterActor,0.2)
			DLC1VampireBatsReformBATSFXS.Play(CasterActor,0.2)
			; We test this again, just in case the player exited floating mode during the Bats effect.  If it is still 3.0, then they did not.
			if DLC1VampireLevitateStateGlobal.GetValue() == 3.0
				DLC1VampireLevitateStateGlobal.setvalue(fLevStateStartValue)
			endif

			;phil is removing the spell here also
			if (CasterActor.isEquipped(batAmulet))
				;CasterActor().removeSpell(amuletSpell)
				CasterActor.dispelSpell(amuletSpell)
			endif
		endif
		utility.wait(2.0)
		bBatsLoopContinue = false
	endif
EndEvent

