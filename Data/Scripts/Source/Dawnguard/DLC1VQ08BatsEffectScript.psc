Scriptname DLC1VQ08BatsEffectScript extends ActiveMagicEffect  

Idle Property BatSprintStart  Auto  
GlobalVariable Property DLC1VampireLevitateStateGlobal Auto
Activator Property DLC1VampLordBatsFXActivator Auto
spell Property DLC1VQ08Bats auto
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
referenceAlias property DLC1VQ08HarkonAlias auto

DLC1PlayerVampireChangeScript Property DLC1PlayerVampireQuest auto
{ so we can tell vampire script when bat effect starts }

float fLevStateStartValue = 0.0
ObjectReference MyBatsFXObjectRef = None
ObjectReference MyBatsFXObjectRef2 = None
bool bBatsLoopContinue = true
actor CasterActor
Float fTranslationSpeed = 512.0
bool bBatsAreGoCheck = False
string BatSprintOff = "BatSprintOff"
Bool bAnimDidHappen = False


Event OnEffectStart(Actor akTarget, Actor akCaster)
	;debug.Trace(self + ": applying effect")
	CasterActor = akCaster
	Bat = (DLC1VQ08HarkonAlias as DLC1dunHarkonBatTeleport)
	
	akCaster.SetGhost(True)
	registerForSingleUpdate(0.2)
	bBatsAreGoCheck = true

	; Make player turn invisible and throw away attached arrows.
	CasterActor.SetSubGraphFloatVariable("fdampRate", 0.20) ;;speeds up fade rate (max 1 min .1
	CasterActor.SetSubGraphFloatVariable("ftoggleBlend", 1.3) ;;blends between two anims default 0 (0 = there 1 = gone)
	CasterActor.ClearExtraArrows()

	; Spawn Bats effect objects and make sure it is visible. Then give it it's first translation update.
	MyBatsFXObjectRef = (CasterActor.placeatme(DLC1VampLordBatsFXActivator))
	MyBatsFXObjectRef.EnableNoWait(false)
	MyBatsFXObjectRef.TranslateToRef(CasterActor,fTranslationSpeed,1)	
		
	CasterActor.TranslateToRef(Bat.teleportObject, 6000.0, 0.0)
	
	bAnimDidHappen = true
	CasterActor.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
	CasterActor.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)
	
	DLC1VampireBatsReformFXS.Play(CasterActor,0.2)
	DLC1VampireBatsReformBATSFXS.Play(CasterActor,0.2)

	utility.wait(fSpellEndDelay)

	CasterActor.DispelSpell(DLC1VQ08Bats)
EndEvent

Event OnUpdate()
	while bBatsLoopContinue
		MyBatsFXObjectRef.TranslateToRef(CasterActor,(CasterActor.GetDistance(MyBatsFXObjectRef) + fTranslationSpeed),1)
		utility.wait(0.2)
	endwhile

	MyBatsFXObjectRef.TranslateToRef(CasterActor,fTranslationSpeed,1)
	utility.wait(0.25)
	MyBatsFXObjectRef.disable()
	MyBatsFXObjectRef.Delete()
	MyBatsFXObjectRef = None
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;debug.Trace(self + ": effect is finished")
	akCaster.SetGhost(False)
	(DLC1VQ08HarkonAlias as DLC1dunHarkonBatTeleport).BatsAllDone()
	
	if bBatsAreGoCheck
		if bAnimDidHappen == false
			CasterActor.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
			CasterActor.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)
			DLC1VampireBatsReformFXS.Play(CasterActor,0.2)
			DLC1VampireBatsReformBATSFXS.Play(CasterActor,0.2)
		endif
		utility.wait(2.0)
		bBatsLoopContinue = false
	endif
EndEvent
