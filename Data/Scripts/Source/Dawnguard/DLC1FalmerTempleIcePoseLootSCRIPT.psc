Scriptname DLC1FalmerTempleIcePoseLootSCRIPT extends ObjectReference Hidden 

Int Property ActorLevel Auto
{
Desired level for the first actor that spawns (All other actors are easy):
0 = Easy (DEFAULT)
1 = Medium
2 = Hard
3 = Boss
}

Bool Property JustBreak = FALSE Auto
{If TRUE the statue(s) will just break and not spawn anything}

bool beenSimmed

;All status that should break out if this gets disturbed
Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto
Keyword Property LinkCustom06 Auto
Keyword Property LinkCustom07 Auto
Keyword Property LinkCustom08 Auto
Keyword Property LinkCustom09 Auto
Keyword Property LinkCustom10 Auto

;Where spawned creatures get plugged in so i can access them later.
ObjectReference Property CreatureToSpawn01 Auto
ObjectReference Property CreatureToSpawn02 Auto
ObjectReference Property CreatureToSpawn03 Auto
ObjectReference Property CreatureToSpawn04 Auto
ObjectReference Property CreatureToSpawn05 Auto
ObjectReference Property CreatureToSpawn06 Auto
ObjectReference Property CreatureToSpawn07 Auto
ObjectReference Property CreatureToSpawn08 Auto
ObjectReference Property CreatureToSpawn09 Auto
ObjectReference Property CreatureToSpawn10 Auto


ActorBase Property DLC1_BF_LVLFrozenFalmerMelee Auto
ActorBase Property DLC1_BF_LVLFrozenChaurus Auto
ActorBase Property DLC1_BF_LVLFrozenFalmerShaman Auto

EffectShader Property DLC1BFIceFormFXS Auto

ObjectReference CurrentSpawn
Bool FirstActorPlaced

Bool AlreadySetup = FALSE

EVENT onCellAttach()
	if (beenSimmed == FALSE && Self.Is3DLoaded())
		MoveToMyEditorLocation()
		setMotionType(Motion_Keyframed, TRUE)
		MoveToMyEditorLocation()
		BlockActivation()
		if (GetLinkedRef())
			if AlreadySetup == FALSE
				TryToSetupActors()
				AlreadySetup = TRUE
			else
				TryToDoubleCheckActors()
			endif
		else
			;Do Nothing
		endif
	endif
endEVENT

EVENT onLoad()
	if (beenSimmed == FALSE && Self.Is3DLoaded())
		MoveToMyEditorLocation()
		setMotionType(Motion_Keyframed, TRUE)
		MoveToMyEditorLocation()
		BlockActivation()
		;if (GetLinkedRef())
		;	if (AlreadySetup == TRUE)
		;		TryToDoubleCheckActors()
		;	endif
		;else
			;Do Nothing
		;endif
	endif
endEVENT

EVENT onActivate(ObjectReference triggerRef)
	if beenSimmed == FALSE
		Disable()
		if (GetLinkedRef())
			ReleaseToHavok()
		else
			;Do Nothing
		endif
		Enable()
		BlockActivation(FALSE)
		triggerRef.AddItem(self)
	endif
endEVENT

;EVENT onHit(ObjectReference var1, Form var2, Projectile var3, bool var4, bool var5, bool var6, bool var7)
;	if beenSimmed == FALSE 
;		if (GetLinkedRef())
;			ReleaseToHavok()
;		else
;			;Do Nothing
;		endif
;	endif
;endEVENT

;EVENT onGrab()
;	if beenSimmed == FALSE
;		if (GetLinkedRef())
;			ReleaseToHavok()
;		else
;			;Do Nothing
;		endif
;	endif
;endEVENT

FUNCTION ReleaseToHavok()
	if (GetLinkedref())
		GetLinkedRef().Disable()
	endif

	beenSimmed = TRUE
	if (Self.Is3DLoaded())
		setMotionType(Motion_Dynamic, TRUE)
		Self.ApplyHavokImpulse(0, 0, 1, 5)
	endif
	TryToSpawnActors()
	BlockActivation(FALSE)
endFUNCTION


	; Try to spawn all linked statue guys
Function TryToSpawnActors()

	If GetLinkedRef(LinkCustom01)
		SpawnActor(GetLinkedRef(LinkCustom01), CreatureToSpawn01)
	endif
	If GetLinkedRef(LinkCustom02)
		SpawnActor(GetLinkedRef(LinkCustom02), CreatureToSpawn02)
	endif
	If GetLinkedRef(LinkCustom03)
		SpawnActor(GetLinkedRef(LinkCustom03), CreatureToSpawn03)
	endif
	If GetLinkedRef(LinkCustom04)
		SpawnActor(GetLinkedRef(LinkCustom04), CreatureToSpawn04)
	endif
	If GetLinkedRef(LinkCustom05)
		SpawnActor(GetLinkedRef(LinkCustom05), CreatureToSpawn05)
	endif
	If GetLinkedRef(LinkCustom06)
		SpawnActor(GetLinkedRef(LinkCustom06), CreatureToSpawn06)
	endif
	If GetLinkedRef(LinkCustom07)
		SpawnActor(GetLinkedRef(LinkCustom07), CreatureToSpawn07)
	endif
	If GetLinkedRef(LinkCustom08)
		SpawnActor(GetLinkedRef(LinkCustom08), CreatureToSpawn08)
	endif
	If GetLinkedRef(LinkCustom09)
		SpawnActor(GetLinkedRef(LinkCustom09), CreatureToSpawn09)
	endif
	If GetLinkedRef(LinkCustom10)
		SpawnActor(GetLinkedRef(LinkCustom10), CreatureToSpawn10)
	endif
EndFunction

	; Compressed function for spawning actors.
Function SpawnActor(ObjectReference akLink, ObjectReference CreatureToSpawn)

	(CreatureToSpawn as Actor).EnableNoWait()
	(CreatureToSpawn as Actor).SetAlpha(0)

	utility.wait(0.25)

	(CreatureToSpawn as Actor).EnableAI(TRUE)

	CreatureToSpawn.MoveTo(akLink)


	akLink.DamageObject(1000)



	if (DLC1BFIceFormFXS)
		DLC1BFIceFormFXS.Play(CreatureToSpawn)
	endif
	(CreatureToSpawn as Actor).SetActorValue("Aggression", 2)
	(CreatureToSpawn as Actor).StartCombat(Game.GetPlayer())
	(CreatureToSpawn as Actor).SetGhost(FALSE)
	(CreatureToSpawn as Actor).SetAlpha(1)


	utility.Wait(utility.RandomFloat(0, 1.0))


EndFunction


	; Try to setup all the linked guys
Function TryToSetupActors()

	If GetLinkedRef(LinkCustom01)
		SetupActor(GetLinkedRef(LinkCustom01))
	endif
	If GetLinkedRef(LinkCustom02)
		SetupActor(GetLinkedRef(LinkCustom02))
	endif
	If GetLinkedRef(LinkCustom03)
		SetupActor(GetLinkedRef(LinkCustom03))
	endif
	If GetLinkedRef(LinkCustom04)
		SetupActor(GetLinkedRef(LinkCustom04))
	endif
	If GetLinkedRef(LinkCustom05)
		SetupActor(GetLinkedRef(LinkCustom05))
	endif
	If GetLinkedRef(LinkCustom06)
		SetupActor(GetLinkedRef(LinkCustom06))
	endif
	If GetLinkedRef(LinkCustom07)
		SetupActor(GetLinkedRef(LinkCustom07))
	endif
	If GetLinkedRef(LinkCustom08)
		SetupActor(GetLinkedRef(LinkCustom08))
	endif
	If GetLinkedRef(LinkCustom09)
		SetupActor(GetLinkedRef(LinkCustom09))
	endif
	If GetLinkedRef(LinkCustom10)
		SetupActor(GetLinkedRef(LinkCustom10))
	endif
EndFunction

	; Compressed function for setup actors.
Function SetupActor(ObjectReference akLink)

	if FirstActorPlaced == FALSE
		if (akLink as DLC1_BF_IceChunkSCRIPT).MonsterType == 0
			CurrentSpawn = akLink.PlaceActorAtMe(DLC1_BF_LVLFrozenFalmerMelee, ActorLevel)
		elseif (akLink as DLC1_BF_IceChunkSCRIPT).MonsterType == 1
			CurrentSpawn = akLink.PlaceActorAtMe(DLC1_BF_LVLFrozenChaurus, ActorLevel)
		elseif (akLink as DLC1_BF_IceChunkSCRIPT).MonsterType == 2
			CurrentSpawn = akLink.PlaceActorAtMe(DLC1_BF_LVLFrozenFalmerShaman, ActorLevel)
		endif
		FirstActorPlaced == TRUE
	elseif FirstActorPlaced == TRUE
		if (akLink as DLC1_BF_IceChunkSCRIPT).MonsterType == 0
			CurrentSpawn = akLink.PlaceActorAtMe(DLC1_BF_LVLFrozenFalmerMelee, 0)
		elseif (akLink as DLC1_BF_IceChunkSCRIPT).MonsterType == 1
			CurrentSpawn = akLink.PlaceActorAtMe(DLC1_BF_LVLFrozenChaurus, 0)
		elseif (akLink as DLC1_BF_IceChunkSCRIPT).MonsterType == 2
			CurrentSpawn = akLink.PlaceActorAtMe(DLC1_BF_LVLFrozenFalmerShaman, 0)
		endif
	endif
	(CurrentSpawn as Actor).EnableAI(TRUE)
	(CurrentSpawn as Actor).SetAlpha(0)

	

	if (DLC1BFIceFormFXS)
		DLC1BFIceFormFXS.Stop(CurrentSpawn)
	endif

	(CurrentSpawn as Actor).SetActorValue("Aggression", 0)
	(CurrentSpawn as Actor).SetGhost(TRUE)
	(CurrentSpawn as Actor).MoveTo(akLink)
	(CurrentSpawn as Actor).EnableAI(FALSE)
	(CurrentSpawn as Actor).DisableNoWait()

	PlugInActor(CurrentSpawn)
EndFunction


	; Plugs in the recently created actors into my fake array
Function PlugInActor(ObjectReference akReference)

	if CreatureToSpawn01 == NONE
		CreatureToSpawn01 = akReference
	elseif	CreatureToSpawn02 == NONE
		CreatureToSpawn02 = akReference
	elseif	CreatureToSpawn03 == NONE
		CreatureToSpawn03 = akReference
	elseif	CreatureToSpawn04 == NONE
		CreatureToSpawn04 = akReference
	elseif	CreatureToSpawn05 == NONE
		CreatureToSpawn05 = akReference
	elseif	CreatureToSpawn06 == NONE
		CreatureToSpawn06 = akReference
	elseif	CreatureToSpawn07 == NONE
		CreatureToSpawn07 = akReference
	elseif	CreatureToSpawn08 == NONE
		CreatureToSpawn08 = akReference
	elseif	CreatureToSpawn09 == NONE
		CreatureToSpawn09 = akReference
	elseif	CreatureToSpawn10 == NONE
		CreatureToSpawn10 = akReference
	endif

EndFunction


	; Try to double check the already spawned actors are in a good state
Function TryToDoubleCheckActors()

	If CreatureToSpawn01
		DoubleCheckActors(CreatureToSpawn01, GetLinkedRef(LinkCustom01))
	endif
	if CreatureToSpawn02
		DoubleCheckActors(CreatureToSpawn02, GetLinkedRef(LinkCustom02))
	endif
	if CreatureToSpawn03
		DoubleCheckActors(CreatureToSpawn03, GetLinkedRef(LinkCustom03))
	endif
	if CreatureToSpawn04
		DoubleCheckActors(CreatureToSpawn04, GetLinkedRef(LinkCustom04))
	endif
	if CreatureToSpawn05
		DoubleCheckActors(CreatureToSpawn05, GetLinkedRef(LinkCustom05))
	endif
	if CreatureToSpawn06
		DoubleCheckActors(CreatureToSpawn06, GetLinkedRef(LinkCustom06))
	endif
	if CreatureToSpawn07
		DoubleCheckActors(CreatureToSpawn07, GetLinkedRef(LinkCustom07))
	endif
	if CreatureToSpawn08
		DoubleCheckActors(CreatureToSpawn08, GetLinkedRef(LinkCustom08))
	endif
	if CreatureToSpawn09
		DoubleCheckActors(CreatureToSpawn09, GetLinkedRef(LinkCustom09))
	endif
	if CreatureToSpawn10
		DoubleCheckActors(CreatureToSpawn10, GetLinkedRef(LinkCustom10))
	endif

EndFunction

	; Compressed function for double checking actors
Function DoubleCheckActors(ObjectReference CreatureToSpawn, ObjectReference akLink)
	;debug.Trace("DoubleCheckActors() is running")
	if (CreatureToSpawn as Actor).IsDead() == FALSE
		;debug.Trace(CreatureToSpawn + " is alive, doing things")

		(CreatureToSpawn as Actor).SetActorValue("Aggression", 0)


		(CreatureToSpawn as Actor).EnableAI(TRUE)
		utility.Wait(0.15)
		;debug.Trace("Moving " + CreatureToSpawn + " to " + akLink + " and making him invisible." )
		(CreatureToSpawn as Actor).SetAlpha(0)
		(CreatureToSpawn as Actor).MoveTo(akLink)
		utility.Wait(0.15)
		(CreatureToSpawn as Actor).EnableAI(FALSE)


		if (DLC1BFIceFormFXS)
			DLC1BFIceFormFXS.Stop(CreatureToSpawn)
		endif

		(CreatureToSpawn as Actor).SetActorValue("Aggression", 0)
	endif

EndFunction