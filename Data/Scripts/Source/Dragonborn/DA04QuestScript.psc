Scriptname DA04QuestScript extends Quest Conditional

ReferenceAlias Property Septimus Auto
ReferenceAlias Property SeptimusEssential Auto
ReferenceAlias Property OghmaInfinium Auto

ObjectReference Property HermaeusMoraTA auto
ObjectReference Property HermaeusMoraFX auto
ObjectReference Property HermaeusMoraActivator auto
ObjectReference Property HermaeusMoraCollision auto
;DLC2HermaeusMoraFaceFXSCRIPT Property DLC2DA04HermaeusMoraFXRef001 Auto

ObjectReference Property HermaeusMoraEndSpot auto
ObjectReference Property HermaeusMoraFXAlt auto
ObjectReference Property HermaeusMoraActivatorAlt auto
ObjectReference Property HermaeusMoraCollisionAlt auto
;DLC2HermaeusMoraFaceFXSCRIPT Property DLC2DA04HermaeusMoraFXRef002 Auto

Spell Property Disappear auto

bool Property AstrolabeOpened auto Conditional
bool Property ReadCrazyBook Auto Conditional
bool Property SeptimusMentionedBlackreach Auto Conditional
bool Property SeptimusReadScroll Auto Conditional
bool Property DefiedHermaeusMora Auto Conditional
bool Property BoxOpened Auto Conditional
bool Property SeptimusSentForPlayer Auto Conditional
bool Property SeptimusStartAscension Auto Conditional

MiscObject Property Extractor Auto

Race Property Altmer auto
Race Property Bosmer auto
Race Property Dunmer auto
Race Property Falmer auto
Race Property Orsimer auto

bool Property GotAltmerBlood auto conditional
bool Property GotBosmerBlood auto conditional 
bool Property GotDunmerBlood auto conditional 
bool Property GotFalmerBlood auto conditional 
bool Property GotOrsimerBlood auto conditional 

bool Property SeptimusVanished auto conditional

Function GotBlood(ObjectReference deadThing)
	ActorBase elf = (deadThing as Actor).GetLeveledActorBase()
	if     (elf.GetRace() == Altmer)
		GotAltmerBlood = true
		SetObjectiveCompleted(41, 1)
	elseif (elf.GetRace() == Bosmer)
		GotBosmerBlood = true
		SetObjectiveCompleted(42, 1)
	elseif (elf.GetRace() == Dunmer)
		GotDunmerBlood = true
		SetObjectiveCompleted(43, 1)
	elseif (elf.GetRace() == Falmer)
		GotFalmerBlood = true
		SetObjectiveCompleted(44, 1)
	elseif (elf.GetRace() == Orsimer)
		GotOrsimerBlood = true
		SetObjectiveCompleted(45, 1)
	endif
	
	if (GotAltmerBlood && GotBosmerBlood && GotDunmerBlood && GotOrsimerBlood && GotFalmerBlood)
		SetStage(50)
	endif
EndFunction

Function EnableHM(bool enabling)
	DLC2DA04PropertiesScript newFX = (HermaeusMoraTA as DLC2DA04PropertiesScript)
; 	debug.trace(self + "fx check: " + HermaeusMoraTA + ", as script " + newFX)
	if (enabling)
; 		Debug.Trace("DA04: Enabling Hermaeus Mora.")
		; make sure we have the DLC2 property
		if newFX && newFX.DLC2DA04HermaeusMoraFXRef001
			newFX.DLC2DA04HermaeusMoraFXRef001.ChangeState()
		else
			HermaeusMoraFX.PlayAnimation("PlayAnim02")
		endif
		HermaeusMoraActivator.Enable()
		HermaeusMoraTA.Enable()
		HermaeusMoraCollision.Enable()
	else
; 		Debug.Trace("DA04: Disabling Hermaeus Mora.")
		if newFX && newFX.DLC2DA04HermaeusMoraFXRef001
			newFX.DLC2DA04HermaeusMoraFXRef001.ChangeState(false)
		else
			HermaeusMoraFX.PlayAnimation("PlayAnim01")
		endif
		HermaeusMoraActivator.Disable()
		HermaeusMoraTA.Disable()
		HermaeusMoraCollision.Disable()
	endif
EndFunction

Function MoveHM()
	HermaeusMoraFX = HermaeusMoraFXAlt
	HermaeusMoraActivator = HermaeusMoraActivatorAlt
	HermaeusMoraCollision = HermaeusMoraCollisionAlt
	DLC2DA04PropertiesScript newFX = (HermaeusMoraTA as DLC2DA04PropertiesScript)
; 	debug.trace(self + "fx check: " + HermaeusMoraTA + ", as script " + newFX)
	if newFX
		newFX.DLC2DA04HermaeusMoraFXRef001 = newFX.DLC2DA04HermaeusMoraFXRef002
	endif
	HermaeusMoraTA.MoveTo(HermaeusMoraEndSpot)
EndFunction

Function WaitForCallback()
; 	Debug.Trace("DA04: Registering for callback event...")
	RegisterForAnimationEvent(Septimus.GetReference(), "T02Ascend")
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if (asEventName == "T02Ascend")
    	SeptimusVanished = true
    	SeptimusEssential.Clear()
		Disappear.Cast(Septimus.GetReference())
		UnregisterForAnimationEvent(Septimus.GetActorReference(), "T02Ascend")
    endif
EndEvent
