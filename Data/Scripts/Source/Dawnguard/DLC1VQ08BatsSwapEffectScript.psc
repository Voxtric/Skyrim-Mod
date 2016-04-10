Scriptname DLC1VQ08BatsSwapEffectScript extends ActiveMagicEffect  

Idle Property BatSprintStart  Auto  
GlobalVariable Property DLC1VampireLevitateStateGlobal Auto
Activator Property DLC1VampLordBatsFXActivator Auto
spell Property DLC1VQ08SwapBats auto
float Property fReformDelay = 0.0 auto
{This will delay the reformation animation effect.}
float Property fSpellEndDelay = 0.0 auto
{This will delay the reformation animation effect.}
EffectShader property DLC1VampireBatsReformFXS auto
{main Effect Shader for spell}
EffectShader property DLC1VampireBatsReformBATSFXS auto
{2nd Effect Shader for spell}
Sound property MagPowersBatsMarker Auto

DLC1dunHarkonBatTeleport property Bat auto
ReferenceAlias property DLC1VQ08HarkonAlias Auto

DLC1PlayerVampireChangeScript Property DLC1PlayerVampireQuest auto
{ so we can tell vampire script when bat effect starts }

float fLevStateStartValue = 0.0
ObjectReference MyBatsFXObjectRef = None
ObjectReference MyBatsFXObjectRef2 = None
bool bBatsLoopContinue = true
Float fTranslationSpeed = 512.0
bool bBatsAreGoCheck = False
string BatSprintOff = "BatSprintOff"
Bool bAnimDidHappen = False

Actor NewHarkon
Actor OldHarkon


Event OnEffectStart(Actor akNewHarkon, Actor akOldHarkon)
	;Debug.Trace("Swapping " + akOldHarkon + " to " + akNewHarkon)
	NewHarkon = akNewHarkon
	OldHarkon = akOldHarkon
	Bat = (DLC1VQ08HarkonAlias as DLC1dunHarkonBatTeleport)
	
	OldHarkon.SetGhost(True)
	NewHarkon.SetGhost(True)
	registerForSingleUpdate(0.2)
	bBatsAreGoCheck = true

	; Turn invisible and throw away attached arrows.
	OldHarkon.SetSubGraphFloatVariable("fdampRate", 0.20) ;;speeds up fade rate (max 1 min .1
	OldHarkon.SetSubGraphFloatVariable("ftoggleBlend", 1.3) ;;blends between two anims default 0 (0 = there 1 = gone)
	OldHarkon.ClearExtraArrows()
	NewHarkon.SetSubGraphFloatVariable("fdampRate", 0.20) ;;speeds up fade rate (max 1 min .1
	NewHarkon.SetSubGraphFloatVariable("ftoggleBlend", 1.3) ;;blends between two anims default 0 (0 = there 1 = gone)
	NewHarkon.ClearExtraArrows()

	; Spawn Bats effect objects and make sure it is visible. Then give it it's first translation update.
	MyBatsFXObjectRef = (OldHarkon.placeatme(DLC1VampLordBatsFXActivator))
	MyBatsFXObjectRef.EnableNoWait(false)
	MyBatsFXObjectRef.TranslateToRef(Bat.teleportObject,fTranslationSpeed,1)
	
	;If we're swapping Harkons, spawn secondary bats.
	MyBatsFXObjectRef2 = (NewHarkon.placeatme(DLC1VampLordBatsFXActivator))
	MyBatsFXObjectRef2.EnableNoWait(false)
	MyBatsFXObjectRef2.TranslateToRef(Bat.teleportObject,fTranslationSpeed,1)	
		
	OldHarkon.TranslateToRef(Bat.teleportObject, 6000.0, 0.0)
	NewHarkon.TranslateToRef(Bat.teleportObject, 6000.0, 0.0)
	
	bAnimDidHappen = true
	
	DLC1VampireBatsReformFXS.Play(OldHarkon,0.2)
	DLC1VampireBatsReformBATSFXS.Play(OldHarkon,0.2)
	DLC1VampireBatsReformFXS.Play(NewHarkon,0.2)
	DLC1VampireBatsReformBATSFXS.Play(NewHarkon,0.2)

	utility.wait(fSpellEndDelay)

	NewHarkon.DispelSpell(DLC1VQ08SwapBats)
EndEvent

Event OnUpdate()
	while bBatsLoopContinue
		MyBatsFXObjectRef.TranslateToRef(OldHarkon,(OldHarkon.GetDistance(MyBatsFXObjectRef) + fTranslationSpeed),1)
		MyBatsFXObjectRef2.TranslateToRef(NewHarkon,(NewHarkon.GetDistance(MyBatsFXObjectRef2) + fTranslationSpeed),1)
		utility.wait(0.2)
	endwhile

	MyBatsFXObjectRef.TranslateToRef(OldHarkon,fTranslationSpeed,1)
	MyBatsFXObjectRef2.TranslateToRef(NewHarkon,fTranslationSpeed,1)
	utility.wait(0.25)
	MyBatsFXObjectRef.disable()
	MyBatsFXObjectRef.Delete()
	MyBatsFXObjectRef = None
	MyBatsFXObjectRef2.disable()
	MyBatsFXObjectRef2.Delete()
	MyBatsFXObjectRef2 = None
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;debug.Trace(self + ": effect is finished")
	OldHarkon.SetGhost(False)
	NewHarkon.SetGhost(False)
	;(DLC1VQ08HarkonAlias as DLC1dunHarkonBatTeleport).BatsAllDone()
	NewHarkon.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
	NewHarkon.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)
	(DLC1VQ08HarkonAlias as DLC1dunHarkonBatTeleport).BatsAllDone()
	OldHarkon.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
	OldHarkon.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)
	
	if bBatsAreGoCheck
		if bAnimDidHappen == false
			OldHarkon.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
			OldHarkon.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)
			NewHarkon.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
			NewHarkon.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)
			DLC1VampireBatsReformFXS.Play(OldHarkon,0.2)
			DLC1VampireBatsReformBATSFXS.Play(OldHarkon,0.2)
			DLC1VampireBatsReformFXS.Play(NewHarkon,0.2)
			DLC1VampireBatsReformBATSFXS.Play(NewHarkon,0.2)
		endif
		utility.wait(2.0)
		bBatsLoopContinue = false
	endif
EndEvent
