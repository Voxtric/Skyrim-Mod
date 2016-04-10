ScriptName DLC1dunHarkonBossBattle extends ReferenceAlias
{The main boss battle script for Harkon at the end of VQ08.}

;Harkon Actor Variables:
; - Variable06 is used as a package condition to control his combat state.
;      1 = Stay in Place (Wait for Teleport, Dying, Toggle, etc.)
;  	   2 = Shrine Event spellcasting
;      3-5 = Mistform Patrols

;Float that controls the state of the battle. Used to be an int, but I needed more granularity.
; 0-1 = Normal Combat
;     0 = Default Magic Combat. We stay in this for 60s or until a Shrine Event triggers. Teleports are to random positions.
;     0.25 = Default Melee Combat. We stay in this for 30s or until a Shrine Event triggers. Teleports are to nearby positions based on distance checks.
;     0.5 = Quick-Flip Combat. We may swap between magic and melee on each teleport. Teleports are determined by the form chosen.
; 1-3 = Starting Shrine Event 1-3
; 4 = In Shrine Event
; 5 = In Mistform
float property HarkonBossBattleState = 0.0 Auto Hidden

;VQ08 Quest this is an alias on.
Quest property DLC1VQ08 Auto
ReferenceAlias property HarkonBattleRealHarkon Auto	;Alias for the questline's Harkon.
ReferenceAlias property HarkonBattleMeleeForm Auto	;Melee Form Harkon for this battle.
ReferenceAlias property HarkonBattleMagicForm Auto	;Magic Form Harkon for this battle.
Actor property SelfActor Auto Hidden
Actor property HarkonBattleRealHarkonActor Auto Hidden
Actor property HarkonBattleMeleeFormActor Auto Hidden
Actor property HarkonBattleMagicFormActor Auto Hidden

;Whether the script has run its initialization (occurs on combat start).
bool scriptVariablesInitialized
bool initialized

;Unique spells manipulated by this script.
Spell property DLC1dunHarkonConjureGargoyleLeftHand Auto
Spell property DLC1HarkonDrain02Alt Auto
Spell property DLC1HarkonMistform Auto
Spell property DLC1dunHarkonInvulnerabilityShield Auto
Spell property DLC1AbHarkonFloatBodyFX Auto
bool SummonedInitialGargoyle									;Once Harkon summons a gargoyle or a shrine event triggers, we remove the spell.

;MAGIC/MELEE FORMS
ReferenceAlias property HarkonBattleHoldPositionMarker Auto	;Where Magic Form Harkon is trying to get to. Effectively keeps him from running away all the time.
ObjectReference property HarkonBattleHoldPositionMarkerObj Auto Hidden
float TimeOfLastFormSwap = 0.0
float MaxTimeInMagicForm = 60.0
float MaxTimeInMeleeForm = 30.0

;SHRINE EVENT
ObjectReference property VQ08ShrineEventMarker Auto		;Location Harkon teleports to (atop shrine collision)
ObjectReference property VQ08ShrineEventCollision Auto	;Collision to enable when Harkon is on the shrine.
ObjectReference property VQ08EnemyTrigger1 Auto			;Traplinkers that hold the enemies to be activated.
ObjectReference property VQ08EnemyTrigger2 Auto
ObjectReference property VQ08EnemyTrigger3 Auto
ObjectReference NextEnemyTrigger
float ShrineEventTimestamp									;When the last Shrine Event triggered.
float MinTimeBetweenShrineEvents = 8.0						;Restricts when Harkon will next use a Shrine Event.
float ShrineThreshold01 = 0.7								;Health Thresholds that trigger the shrine events.
float ShrineThreshold02 = 0.4
float ShrineThreshold03 = 0.2
bool ShrineEventActive = False						;Is a Shrine Event active?
bool property ShieldDestroyed = False Auto Hidden	;Property checked by the shield magic effect to determine whether the shield blows up or gets dismissed quietly.
int property LastShrineEvent = 0 Auto Hidden		;What Shrine Event did we do most recently?
float ShrineEventFailsafeTimer = 0.0				;Timer that kicks Harkon out of his Shrine event.

Weapon property DLC1AurielsBow Auto					;Bow and Arrows to look for.
Explosion property DLC1AurielsBowExp01 Auto
Explosion property ExplosionIllusionDark01 Auto
Ammo property DLC1ElvenArrowBlessed Auto
Ammo property DLC1ElvenArrowBlood Auto
bool property PlayerHasAurielsBow Auto Hidden

Scene property DLC1VQ08HarkonBattleScene Auto					;Scene telling the player to use the bow.
float property ShrineEventSceneTimer = 0.0	Auto hidden		;When did we last play this scene?


;MISTFORM
ObjectReference property VQ08MistformEventMarker Auto		;Marker to translate to at start, to make sure Harkon doesn't get stuck on the shrine.
ReferenceAlias property HarkonBattleNoNameAlias Auto		;Alias with an override empty name, to avoid awkward activation text.
float MistformTimer											;Timer for when we started mistform.
float MaxTimeInMistform = 20.0								;Max time we'll stay in mistform.


;HARKON DEATH SCENE
Spell property DLC1FXCastVampireBleedSpell Auto
Armor property DLC1VampireSkeletonFXArmor Auto
ObjectReference property DeadHarkonWarpMarker Auto
bool inDeathThroesTeleport = False							;Are we in the final 'death throes' teleport?
bool doneDeathThroesTeleport = False						;Have we finished the final 'death throes' teleport?
bool doneFinalDeath = False									;Have we begun executing Harkon's OnDying block?
int DeathThroesTeleportsLeft = 2
Activator property DLC1dunHarkonAshPile Auto
ObjectReference property DLC1dunHarkonDeathFXAct Auto
Sound property AmbRumbleShake Auto
EffectShader property DLC1SunFireImpactFXShader Auto
Spell property DLC1dunHarkonDeathSpell Auto
ObjectReference property VQ08ExplosionSourceMarker Auto
Explosion property DLC1VampiresBaneExplosion Auto
ObjectReference property VQ08HarkonGroundMarker Auto
Explosion property HarkonDeathExplosion Auto

;TELEPORTING
ObjectReference[] property HarkonTeleportPoints Auto		;Array of possible teleport locations.
int MultiTeleportCount = 0									;Number of times to teleport in sequence.
bool TeleportInProgress										;Is a teleport in progress? If so, prevent anything else from teleporting him.
float MagicFormHoldPositionTimestamp = -1.0
float HealthPercentAtLastTeleport = 1.0
float MagicFormHealthPercentLossAllowed = 0.20
float MeleeFormHealthPercentLossAllowed = 0.30
float TimeOfLastTeleport = 0.0
float MaxTimeBetweenTeleports = 30.0
bool shouldTeleportCornered = False
Static property HarkonTeleportMarker Auto			;The unique base object for Harkon's teleport markers.

;Harkon minions.
ObjectReference[] property HarkonMinions Auto

;Hit Timestamps
float TimerPreviousHit01 = 0.0		;Timestamps that record when the player hits Harkon with an attacked.
float TimerPreviousHit02 = 0.0		;Used to approximately detect when he's been 'cornered' so he can escape.
float TimerPreviousHit03 = 0.0
float TimerPreviousHit04 = 0.0
float TimerPreviousHit05 = 0.0
float TimerPreviousHit06 = 0.0
float TimerOfRecord = 0.0			;Timer used to determine when Harkon was cornered.

;Harkon's Cape
Armor property DLC1VampireLordCape Auto

;Music for the boss battle. Needed to prevent the audio from cutting in and out of combat constantly.
MusicType property MUSCombatBoss Auto

;Vampire and Werewolf beast forms.
Race property VampireBeastRace Auto
Race property WerewolfBeastRace Auto


;--------------------------------------------------------------
;Main Battle Loops: OnHit and OnUpdate
;---------------------------------------

Function InitializeHarkonBattle() 
	if (!scriptVariablesInitialized)
		InitializeScriptVariables()
	EndIf
EndFunction

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if (!initialized)
		initialized = True
		if (!scriptVariablesInitialized)
			InitializeScriptVariables()
		EndIf
		float currentTime = Utility.GetCurrentRealTime()
		TimeOfLastFormSwap = currentTime
		TimeOfLastTeleport = currentTime
		PlayerHasAurielsBow = (Game.GetPlayer().GetItemCount(DLC1AurielsBow) > 0)
		;Debug.Trace("Start the music!")
		MUSCombatBoss.Add()
		GoToState("Ready")
		OnUpdate()
	EndIf
EndEvent

Function InitializeScriptVariables()
	float currentTime = Utility.GetCurrentRealTime()
	TimeOfLastFormSwap = currentTime
	TimeOfLastTeleport = currentTime
	SelfActor = Self.GetActorRef()
	HarkonBattleRealHarkonActor = HarkonBattleRealHarkon.GetActorRef()
	HarkonBattleMeleeFormActor = HarkonBattleMeleeForm.GetActorRef()
	HarkonBattleMagicFormActor = HarkonBattleMagicForm.GetActorRef()
	HarkonBattleMeleeFormActor.GetActorBase().SetEssential(False)
	HarkonBattleMagicFormActor.GetActorBase().SetEssential(False)
	HarkonBattleMeleeFormActor.StartDeferredKill()
	HarkonBattleMagicFormActor.StartDeferredKill()
	HarkonBattleHoldPositionMarkerObj = HarkonBattleHoldPositionMarker.GetReference()
	scriptVariablesInitialized = True
EndFunction

;Every second, we check to see if we need to update Harkon's state.
Function OnUpdate()
	If (!inDeathThroesTeleport)
		ProcessOnUpdateOROnHitEvent(None, None)
		RegisterForSingleUpdate(1)
	EndIf
EndFunction

Auto State Ready
;On hit, check to see which state we're in and respond accordingly.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	ProcessOnUpdateOROnHitEvent(aggressor, weap)
EndEvent

;We have to handle both types of events in this single function to prevent interleaving errors from asynchronus events.
Function ProcessOnUpdateOROnHitEvent(ObjectReference aggressor, Form weap)
	GoToState("Busy")
	;Debug.Trace("HARKON:  Harkon Processing----------")
	;Debug.Trace("HARKON:  PROCESSING: " + SelfActor + ", Health: " + SelfActor.GetAV("Health"))
	int activeMinionsCount = CountActiveMinions()
	float healthPercentage = SelfActor.GetAVPercentage("Health")
	float currentTime = Utility.GetCurrentRealTime()
	
	;Are we dead or dying? If so, don't do anything.
	If (!initialized)
		;Debug.Trace("HARKON:  Not Initialized Yet")
		;Do nothing!
	ElseIf (HarkonBossBattleState == 4 && inDeathThroesTeleport)
		;If we're in the process of dying, but have wound up on the Shrine instead, bail out.
		EndShrineEvent(None, None)
	ElseIf (inDeathThroesTeleport)
		;Debug.Trace("HARKON:  In Death Throes")
		;Do nothing!
	ElseIf (SelfActor.GetAV("Health") <= 0)
		;Debug.Trace("HARKON:  Triggering Death Throes")
		;Start the Death Throes process. This is the only way we can catch the actor's 'death' because Deferred Kill is on.
		BeginDeathThroes()
	ElseIf (HarkonBossBattleState < 1)
	
		If (!SelfActor.IsInCombat())
			SelfActor.StartCombat(Game.GetPlayer())
		EndIf
	
		;If we've passed one of the shrine health thresholds, that's our top priority.
		If (healthPercentage < ShrineThreshold01 && !ShrineEventActive && LastShrineEvent == 0)
			;Debug.Trace("HARKON:  Process SetupShrineEvent1")
			SetupShrineEvent(1)
		ElseIf (healthPercentage < ShrineThreshold02 && !ShrineEventActive && LastShrineEvent == 1 && (currentTime - ShrineEventTimestamp) > MinTimeBetweenShrineEvents)
			;Debug.Trace("HARKON:  Process SetupShrineEvent2")
			SetupShrineEvent(2)
		ElseIf (healthPercentage < ShrineThreshold03 && !ShrineEventActive && LastShrineEvent == 2 && (currentTime - ShrineEventTimestamp) > MinTimeBetweenShrineEvents)
			;Debug.Trace("HARKON:  Process SetupShrineEvent3")
			SetupShrineEvent(3)
			
		ElseIf (HarkonBossBattleState == 0 && currentTime - TimeOfLastFormSwap > MaxTimeInMagicForm)
			;Debug.Trace("HARKON:  Magic Form timer exceeded. Swapping forms.")
			TimeOfLastFormSwap = currentTime
			HarkonBossBattleState = 0.25
			TeleportHarkon()
		ElseIf (HarkonBossBattleState == 0.25 && currentTime - TimeOfLastFormSwap > MaxTimeInMeleeForm)
			;Debug.Trace("HARKON:  Melee Form timer exceeded. Swapping forms.")
			TimeOfLastFormSwap = currentTime
			HarkonBossBattleState = 0
			TeleportHarkon()
		ElseIf (SelfActor == HarkonBattleMagicFormActor && SelfActor.GetDistance(HarkonBattleHoldPositionMarker.GetReference()) < 400 && MagicFormHoldPositionTimestamp == -1)
			;Debug.Trace("HARKON:  Reached Hold Position marker. Setting Timestamp.")
			MagicFormHoldPositionTimestamp = currentTime
		ElseIf (SelfActor == HarkonBattleMagicFormActor && MagicFormHoldPositionTimestamp > 0 && currentTime - MagicFormHoldPositionTimestamp > 5)
			;Debug.Trace("HARKON:  Selecting new Hold Position Marker.")
			PickNewHoldPositionTargetWithEVP()
		ElseIf (SelfActor == HarkonBattleMagicFormActor && healthPercentage < (HealthPercentAtLastTeleport - MagicFormHealthPercentLossAllowed))
			;Debug.Trace("HARKON:  Now Teleporting: Health Threshold (Magic) met.")
			TeleportHarkon()
		ElseIf (SelfActor == HarkonBattleMeleeFormActor && healthPercentage < (HealthPercentAtLastTeleport - MeleeFormHealthPercentLossAllowed))
			;Debug.Trace("HARKON:  Now Teleporting: Health Threshold (Melee) met.")
			TeleportHarkon()
		ElseIf (shouldTeleportCornered && currentTime - TimerOfRecord < 4)
			;Debug.Trace("HARKON:  Waiting until full 4s are up.")
		ElseIf (shouldTeleportCornered && currentTime - TimerOfRecord >= 4)
			;Debug.Trace("HARKON:  Now Teleporting: Player cornered Harkon.")
			TeleportHarkon()
		ElseIf (currentTime - TimeOfLastTeleport > MaxTimeBetweenTeleports)
			;Debug.Trace("HARKON:  Now Teleporting: Max Time Between Teleports exceeded.")
			TeleportHarkon()
			;Is Harkon in normal combat? If so, track hits so we can catch when he becomes 'stuck'.
		ElseIf (aggressor == Game.GetPlayer())
			;Debug.Trace("HARKON:  Registered normal hit.")
			TimerPreviousHit06 = TimerPreviousHit05
			TimerPreviousHit05 = TimerPreviousHit04
			TimerPreviousHit04 = TimerPreviousHit03
			TimerPreviousHit03 = TimerPreviousHit02
			TimerPreviousHit02 = TimerPreviousHit01
			TimerPreviousHit01 = currentTime
		
			if (SelfActor == HarkonBattleMagicFormActor && TimerPreviousHit01 - TimerPreviousHit04 < 6)
				shouldTeleportCornered = True
				TimerOfRecord = TimerPreviousHit04
			ElseIf (SelfActor == HarkonBattleMeleeFormActor && TimerPreviousHit01 - TimerPreviousHit06 < 8)
				shouldTeleportCornered = True
				TimerOfRecord = TimerPreviousHit06
			EndIf
		EndIf
		
	ElseIf (HarkonBossBattleState == 4)
		If (inDeathThroesTeleport)
			EndShrineEvent(None, None)
		ElseIf (activeMinionsCount == 0 && ShrineEventFailsafeTimer == 0)
			;Debug.Trace("HARKON:  Shrine Update: Setting Failsafe Timer")
			ShrineEventFailsafeTimer = currentTime
		ElseIf (activeMinionsCount > 0 && ShrineEventFailsafeTimer > 0)
			;Debug.Trace("HARKON:  Shrine Update: Jumped the gun. Resetting Shrine Event Failsafe Timer")
			ShrineEventFailsafeTimer = 0
		ElseIf (activeMinionsCount == 0 && currentTime - ShrineEventFailsafeTimer >= 12)
			;Debug.Trace("HARKON:  Shrine Update: Failsafe Triggered")
			EndShrineEvent(None, None)
		ElseIf (ShrineEventSceneTimer == 0)
			;Debug.Trace("HARKON:  First time only, delay the scene.")
			ShrineEventSceneTimer = currentTime
		ElseIf (currentTime - ShrineEventSceneTimer > 15 && !DLC1VQ08HarkonBattleScene.IsPlaying() && PlayerHasAurielsBow)
			Race playerRace = Game.GetPlayer().GetRace()
			if ((VampireBeastRace == None || VampireBeastRace != playerRace) && (WerewolfBeastRace == None || WerewolfBeastRace != playerRace))
				if (SelfActor.GetAV("Variable09") == 0)
					SelfActor.SetAV("Variable09", 1)
				EndIf
				ShrineEventSceneTimer = currentTime
				DLC1VQ08HarkonBattleScene.Start()
			EndIf
		EndIf
		
	ElseIf (HarkonBossBattleState == 5)
		;If we're in Mistform, bail out if all of our minions are dead, or if time elapses.
		;Debug.Trace("HARKON:  Mistform Time: " + currentTime + ", " + MistformTimer)
		If (activeMinionsCount == 0)
			;Debug.Trace("HARKON:  Mistform Update: All minions dead.")
			EndMistform()
		ElseIf (currentTime > MistformTimer)
			;Debug.Trace("HARKON:  Mistform Update: Ending mistform by timer. " + Utility.GetCurrentRealTime() + " > " + MistformTimer)
			EndMistform()
		EndIf
	EndIf
	
	;Debug.Trace("HARKON:  ----------------------------")
	GoToState("Ready")
EndFunction
EndState

State Busy
	Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do Nothing
	EndEvent	
	Function ProcessOnUpdateOROnHitEvent(ObjectReference aggressor, Form weap)
		;Do Nothing
	EndFunction
EndState

Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;Do nothing.
EndEvent
Function ProcessOnUpdateOROnHitEvent(ObjectReference aggressor, Form weap)
	;Do Nothing
EndFunction

Function ProcessShadowShieldHit(ObjectReference aggressor, Form weap)
	;This should all be handled by DLC1dunHarkonShadowShield now.
	;
	;If (HarkonBossBattleState == 4 && weap == DLC1AurielsBow)
	;	EndShrineEvent(aggressor as Actor, weap as Weapon)
	;ElseIf (HarkonBossBattleState == 4 && weap != None && !DLC1VQ08HarkonBattleScene.IsPlaying() && Utility.GetCurrentRealTime() - ShrineEventSceneTimer > 5)
	;	ShrineEventSceneTimer = Utility.GetCurrentRealTime()
	;	DLC1VQ08HarkonBattleScene.Start()
	;EndIf
EndFunction


;Count how many 'active' enemies are left other than Harkon himself.
int Function CountActiveMinions()
	int count = 0
	int i = 0
	Actor currentMinion
	While (i < HarkonMinions.Length)
		currentMinion = HarkonMinions[i] as Actor
		if (currentMinion.GetAV("Aggression") > 0 && !currentMinion.IsCommandedActor() && !currentMinion.IsDead())
			count = count + 1
		EndIf
		i = i + 1
	EndWhile
	;Debug.Trace("HARKON:  Active Minions = " + count)
	return count
EndFunction

Function RecordSummonedGargoyle()
	if (!SummonedInitialGargoyle)
		;Debug.Trace("HARKON:  Gargoyle summoned. Removing the spell.")
		SummonedInitialGargoyle = True
		(SelfActor as DLC1HarkonCombatMagicLevelingScript).ReequipDrainSpell()
	EndIf
	SelfActor.RemoveSpell(DLC1dunHarkonConjureGargoyleLeftHand)
EndFunction

Function ResetHitClock()
	TimerPreviousHit01 = 0
	TimerPreviousHit02 = 0
	TimerPreviousHit03 = 0
	TimerPreviousHit04 = 0
	TimerPreviousHit05 = 0
	TimerPreviousHit06 = 0
	TimerOfRecord = 0
EndFunction


;--------------------------------------------------------------
;Melee and Magic Forms
;---------------------

;Harkon's Magic Form moves between Hold Position targets to allow him to move while still forcing him to stop periodically.
Function PickNewHoldPositionTargetWithEVP()
	if (HarkonBossBattleState < 1 && !inDeathThroesTeleport)
		MagicFormHoldPositionTimestamp = -1
		HarkonBattleHoldPositionMarker.ForceRefTo(PickTeleportMarkerRandomly())
		if (SelfActor.GetAV("Variable06") <= 1)
			SelfActor.SetAV("Variable06", 1)
			SelfActor.EvaluatePackage()
		EndIf
		if (SelfActor.GetAV("Variable06") <= 1)
			SelfActor.SetAV("Variable06", 0)
			SelfActor.EvaluatePackage()
		EndIf
		;Debug.Trace("HARKON:  PickNewHoldPositionTarget w/ EVPs resets Variable06 to 0.")
	EndIf
EndFunction

Function PickNewHoldPositionTargetWithoutEVP()
	MagicFormHoldPositionTimestamp = -1
	HarkonBattleHoldPositionMarker.ForceRefTo(PickTeleportMarkerRandomly())
	;Debug.Trace("HARKON:  PickNewHoldPositionTarget w/o EVPs picked a new target")
EndFunction


;--------------------------------------------------------------
;Teleport via Bats
;-----------------
;TRIGGERS: As Needed.

Function TeleportHarkon()
	if (!TeleportInProgress && HarkonBossBattleState != 4)
		TeleportInProgress = True
		SelfActor.DispelAllSpells()
		;Debug.Trace("HARKON:  Now Teleporting. State: " + HarkonBossBattleState)
		if (inDeathThroesTeleport)
			;Support legacy saves that had a higher number...
			if (DeathThroesTeleportsLeft > 2)
				DeathThroesTeleportsLeft = 2
			EndIf
			if (DeathThroesTeleportsLeft == 2)
				BatTeleportToEndSameForm(HarkonTeleportPoints[11])
			ElseIf (DeathThroesTeleportsLeft == 1)
				BatTeleportToEndSameForm(HarkonTeleportPoints[1])
			ElseIf (DeathThroesTeleportsLeft == 0)
				BatTeleportToEndSameForm(HarkonTeleportPoints[0])
			EndIf
		ElseIf (HarkonBossBattleState == 0)
			;Standard magic teleport.
			BatTeleportToEndMagic(PickTeleportMarkerRandomly())
		ElseIf (HarkonBossBattleState == 0.25)
			;Standard melee teleport.
			BatTeleportToEndMelee(PickTeleportMarkerNearby())
		ElseIf (HarkonBossBattleState == 0.5)
			int roll = Utility.RandomInt(0, 1)
			if (roll == 0)
				;Debug.Trace("HARKON:  Magic!")
				BatTeleportToEndMagic(PickTeleportMarkerRandomly())
			Else
				;Debug.Trace("HARKON:  Melee!")
				BatTeleportToEndMelee(PickTeleportMarkerNearby())
			EndIf
		Else
			;Debug.Trace("HARKON:  TeleportHarkon() called in invalid state: " + HarkonBossBattleState)
		EndIf
	EndIf
EndFunction

ObjectReference Function PickTeleportMarkerRandomly()
	int point = Utility.RandomInt(0, HarkonTeleportPoints.Length - 1)
	;Debug.Trace("HARKON:  Pick Randomly: " + point + ": " + HarkonTeleportPoints[point])
	return HarkonTeleportPoints[point]
EndFunction

ObjectReference Function PickTeleportMarkerNearby()
	ObjectReference closestMarker = Game.FindClosestReferenceOfTypeFromRef(HarkonTeleportMarker, Game.GetPlayer(), 3000)
	if (closestMarker == None)
		closestMarker = PickTeleportMarkerRandomly()
	EndIf

	;Identify the closest teleport point, offset from it +/-2, and go there.
	int closestPoint = 0
	int i = 0
	While (i < HarkonTeleportPoints.Length)
		if (HarkonTeleportPoints[i] == closestMarker)
			closestPoint = i
			i = HarkonTeleportPoints.Length
		EndIf
		i = i + 1
	EndWhile
	int offset = Utility.RandomInt(0, 1)
	if (offset == 0)
		offset = -1
	EndIf
	int targetPoint = closestPoint + offset
	if (targetPoint >= HarkonTeleportPoints.Length)
		targetPoint = 0
	ElseIf (targetPoint < 0)
		targetPoint = HarkonTeleportPoints.Length - 1
	EndIf
	return HarkonTeleportPoints[targetPoint]
EndFunction

Function BatTeleportToEndSameForm(ObjectReference target)
	if (SelfActor == HarkonBattleMagicFormActor)
		BatTeleportToEndMagic(target)
	Else
		BatTeleportToEndMelee(target)
	EndIf
EndFunction

Function BatTeleportToEndSwapForm(ObjectReference target)
	if (SelfActor == HarkonBattleMagicFormActor)
		BatTeleportToEndMelee(target)
	Else
		BatTeleportToEndMagic(target)
	EndIf
EndFunction

Function BatTeleportToEndMagic(ObjectReference target)
	;Debug.Trace("HARKON:  BatTeleportToEndMagic called.")
	;Debug.Trace("HARKON:  Updating health thresholds.")
	HealthPercentAtLastTeleport = SelfActor.GetAVPercentage("Health")
	TimeOfLastTeleport = Utility.GetCurrentRealTime()
	PickNewHoldPositionTargetWithoutEVP()
	TimerOfRecord = 0
	shouldTeleportCornered = False
	((Self as ReferenceAlias) as DLC1dunHarkonBatTeleport).BatTeleportToEndMagic(target)
EndFunction

Function BatTeleportToEndMelee(ObjectReference target)
	;Debug.Trace("HARKON:  BatTeleportToEndMelee called.")
	;Debug.Trace("HARKON:  Updating health thresholds.")
	HealthPercentAtLastTeleport = SelfActor.GetAVPercentage("Health")
	TimeOfLastTeleport = Utility.GetCurrentRealTime()
	TimerOfRecord = 0
	shouldTeleportCornered = False
	((Self as ReferenceAlias) as DLC1dunHarkonBatTeleport).BatTeleportToEndMelee(target)
EndFunction

Function HarkonReforms()
	;Harkon is reforming from bat form. Determine what, if anything, we want to do in response.
	;Debug.Trace("HARKON:  Harkon Reformed.")
	HarkonBattleMagicFormActor.GetActorBase().SetInvulnerable(False)
	HarkonBattleMeleeFormActor.GetActorBase().SetInvulnerable(False)
	
	;Make sure we don't stay in the teleport package.
	if (HarkonBossBattleState != 4 && !inDeathThroesTeleport)
		SelfActor.SetAV("Variable06", 0)
	EndIf
	
	;Allow teleports going forward.
	TeleportInProgress = False
	ResetHitClock()
	
	If (HarkonBossBattleState == 1 || HarkonBossBattleState == 2 || HarkonBossBattleState == 3)
		;Debug.Trace("HARKON:  Harkon Starts Shrine")
		StartShrineEvent()
	ElseIf (inDeathThroesTeleport)
		if (SelfActor == HarkonBattleMagicFormActor)
			;Debug.Trace("HARKON:  Moving Melee Harkon to platform.")
			HarkonBattleMeleeFormActor.MoveTo(DeadHarkonWarpMarker)
		Else
			;Debug.Trace("HARKON:  Moving Magic Harkon to platform.")
			HarkonBattleMagicFormActor.MoveTo(DeadHarkonWarpMarker)
		EndIf
		if (SelfActor.GetAV("Variable10") <= 0)
			SelfActor.SetAV("Variable10", 1)
		Else
			SelfActor.SetAV("Variable10", 0)
		EndIf
		if (DeathThroesTeleportsLeft > 0)
			DeathThroesTeleportsLeft = DeathThroesTeleportsLeft - 1
			SelfActor.SetAV("Variable06", 1)
			SelfActor.EvaluatePackage()
			TeleportHarkon()
		Else
			;Debug.Trace("HARKON:  Harkon Reformed. Kill him.")
			doneDeathThroesTeleport = True
			SelfActor.SetAV("Variable06", 1)
			SelfActor.EvaluatePackage()
			EndDeathThroes()
		EndIf
	ElseIf (MultiTeleportCount > 0)
		MultiTeleportCount = MultiTeleportCount - 1
		TeleportHarkon()
	Else
		SelfActor.StartCombat(Game.GetPlayer())
	EndIf
	
	SelfActor.EvaluatePackage()
EndFunction


;--------------------------------------------------------------
;Shrine Events
;---------------
;TRIGGERS: Health Thresholds.

;Trigger enemies and warp Harkon to the Shrine.
Function SetupShrineEvent(int eventNum)
	If (TeleportInProgress)
		Return
	EndIf
	SelfActor.DispelAllSpells()
	TeleportInProgress = True
	ShrineEventActive = True
	if (eventNum == 1)
		NextEnemyTrigger = VQ08EnemyTrigger1
		;Strip the Summon Gargoyle spell, if it hasn't been used already.
		RecordSummonedGargoyle()
	ElseIf (eventNum == 2)
		NextEnemyTrigger = VQ08EnemyTrigger2
	Else
		NextEnemyTrigger = VQ08EnemyTrigger3
	EndIf
	HarkonBossBattleState = eventNum
	LastShrineEvent = eventNum
	VQ08ShrineEventCollision.Enable()
	BatTeleportToEndMagic(VQ08ShrineEventMarker)
EndFunction

;Activate Harkon's shield spell.
Function StartShrineEvent()
	;Update Harkon's AI so he stays put and casts his invulnerability shield spell.
	if (SelfActor.GetAV("Health") < 0)
		if (inDeathThroesTeleport)
			HarkonBossBattleState = 0
			TeleportHarkon()
		Else
			BeginDeathThroes()
		EndIf
		Return
	EndIf
	SelfActor.EquipSpell(DLC1dunHarkonInvulnerabilityShield, 1)
	SelfActor.SetAV("Variable06", 2)
	SelfActor.EvaluatePackage()
	NextEnemyTrigger.Activate(SelfActor)
	if (LastShrineEvent > 1)
		ShrineEventSceneTimer = Utility.GetCurrentRealTime()
	EndIf
	HarkonBossBattleState = 4
EndFunction

;Cancel shield spell and complete shrine event.
Function EndShrineEvent(Actor aggressorIfAny, Weapon weaponIfAny)
	if (HarkonBossBattleState == 4)
		;Clean up the Shrine event.
		;Debug.Trace("HARKON:  Shrine Event is ending. Clean up.")
		float currentTime = Utility.GetCurrentRealTime()
		TimeOfLastFormSwap = currentTime
		HarkonBossBattleState = 0
		if (weaponIfAny == DLC1AurielsBow)
			ShieldDestroyed = True
			SelfActor.RampRumble(0.75, 2, 1600)
			Game.ShakeCamera(SelfActor, 0.75, 2)
		Else
			ShieldDestroyed = False
		EndIf
		SelfActor.SetAV("Variable06", 1)
		SelfActor.EvaluatePackage()
		SelfActor.InterruptCast()
		SelfActor.DispelSpell(DLC1dunHarkonInvulnerabilityShield)
		HarkonBattleMagicFormActor.GetActorBase().SetInvulnerable(False)
		HarkonBattleMeleeFormActor.GetActorBase().SetInvulnerable(False)
	
		if (weaponIfAny == DLC1AurielsBow)
			if (AggressorIfAny.IsEquipped(DLC1ElvenArrowBlessed))
				;Debug.Trace("HARKON:  Sunhallowed Arrow: Big explosion! Big damage!")
				;SelfActor.PlaceAtMe(DLC1AurielsBowExp01)
				DealShrineEventHealthDamage(50)
			ElseIf (!AggressorIfAny.IsEquipped(DLC1ElvenArrowBlood))
				;Debug.Trace("HARKON:  Normal Arrow: Explosion! Damage! Stagger!")
				;SelfActor.PlaceAtMe(DLC1AurielsBowExp01)
				DealShrineEventHealthDamage(25)
			Else
				;Debug.Trace("HARKON:  Blood Arrow: Small explosion. Just End It!")
				;SelfActor.PlaceAtMe(ExplosionIllusionDark01)
			EndIf
		Else
			;("Shrine event ended normally.")
		EndIf
		ShrineEventActive = False
		ShrineEventTimestamp = currentTime
		ShrineEventFailsafeTimer = 0
		
		;Debug.Trace("HARKON:  Evaluating next step. " + LastShrineEvent + ", " + CountActiveMinions())
		if (inDeathThroesTeleport)
			TeleportHarkon()
		ElseIf (LastShrineEvent == 2 && CountActiveMinions() > 0)
			StartMistform()
		ElseIf ((LastShrineEvent == 1 || LastShrineEvent == 3) && CountActiveMinions() > 1)
			StartMistform()
		Else
			SelectPostShrineCombatStage()
			TeleportHarkon()
		EndIf
		
		VQ08ShrineEventCollision.Disable()
	EndIf
EndFunction

Function SelectPostShrineCombatStage()
	if (LastShrineEvent < 2)
		HarkonBossBattleState = 0
	ElseIf (LastShrineEvent == 2)
		HarkonBossBattleState = 0.25
	Else
		HarkonBossBattleState = 0.5
	EndIf
EndFunction

Function DealShrineEventHealthDamage(int damage)
	if (SelfActor.GetAV("Health") > damage)
		SelfActor.DamageAV("Health", damage)
	Else
		SelfActor.DamageAV("Health", (SelfActor.GetAV("Health") - 1))
	EndIf
EndFunction



;--------------------------------------------------------------
;Mistform Events
;---------------
;TRIGGERS: After a Shrine Event, if 2+ enemies are active.

Function StartMistform()
	;Begin running a mistform patrol package.
	int patrol = Utility.RandomInt(0, 1)
	SelfActor.SetAV("Variable06", (3 + patrol))
	SelfActor.EvaluatePackage()
	;Cast Mistform and hide Harkon's name so he can't be selected.
	DLC1HarkonMistform.Cast(SelfActor, SelfActor)
	SelfActor.TranslateToRef(VQ08MistformEventMarker, 6000.0, 0.0)
	HarkonBattleNoNameAlias.ForceRefTo(SelfActor)
	;Set timestamp and battle state.
	MistformTimer = Utility.GetCurrentRealTime() + MaxTimeInMistform
	HarkonBossBattleState = 5
	;Debug.Trace("HARKON:  Harkon entered mistform and started patrol " + (3+patrol) + " with timer " + MistformTimer)
EndFunction

Function EndMistform()
	TimeOfLastFormSwap = Utility.GetCurrentRealTime()
	SelectPostShrineCombatStage()
	SelfActor.DispelSpell(DLC1HarkonMistform)
	HarkonBattleNoNameAlias.Clear()
	HarkonBattleMagicFormActor.GetActorBase().SetInvulnerable(False)
	HarkonBattleMeleeFormActor.GetActorBase().SetInvulnerable(False)
	SelfActor.SetAV("Variable06", 0)
	SelfActor.StartCombat(Game.GetPlayer())
	SelfActor.EvaluatePackage()
	;Debug.Trace("HARKON:  Harkon exited mistform.")
EndFunction



;--------------------------------------------------------------
;Death Events
;------------

Event OnDeath(Actor akKiller)
	if (!doneFinalDeath)
		Debug.Trace("ERROR: HARKON HAS DIED PREMATURELY.")
		doneDeathThroesTeleport = True
		EndDeathThroes()
	EndIf
EndEvent

Function BeginDeathThroes()
	if (!scriptVariablesInitialized)
		InitializeScriptVariables()
	EndIf
	if (!inDeathThroesTeleport)
		inDeathThroesTeleport = True
		SelfActor.BlockActivation()
		SelfActor.GetActorBase().SetInvulnerable(True)
		;Kill any surviving minions.
		int i = 0
		While (i < HarkonMinions.Length)
			if ((HarkonMinions[i] as DLC1dunHarkonReanimatedMinions) != None)
				(HarkonMinions[i] as DLC1dunHarkonReanimatedMinions).IsSpecialDeath = True
			EndIf
			if (!HarkonMinions[i].IsDisabled())
				(HarkonMinions[i] as Actor).Kill()
			EndIf
			i = i + 1
		EndWhile
		TeleportHarkon()
	EndIf
EndFunction

Event EndDeathThroes()
	If (doneDeathThroesTeleport && !doneFinalDeath)
		;Debug.Trace("HARKON:  End death teleport. Harkon killed by script.")
		;Begin disintegration and vfx.
		doneFinalDeath = True
		MUSCombatBoss.Remove()
		SelfActor.SetSubGraphFloatVariable("fdampRate", 1.0) ;;speeds up fade rate (max 1 min .1
		SelfActor.SetSubGraphFloatVariable("ftoggleBlend", 0.0);;blends between two anims default 0 (0 = there 1 = gone)
		DLC1FXCastVampireBleedSpell.Cast(SelfActor, SelfActor)
		VQ08HarkonGroundMarker.MoveTo(SelfActor, 0, 0, -1, False)
		DLC1dunHarkonDeathFXAct.MoveTo(VQ08HarkonGroundMarker)
		DLC1dunHarkonDeathFXAct.PlayAnimation("PlayAnim01")
		SelfActor.BlockActivation(True)
		SelfActor.SetGhost(True)
		SelfActor.ClearExtraArrows()
		;This is almost certainly unnecessary, but just to be safe, we'll end the deferred kill state for both actors, then make sure the current one will die.
		HarkonBattleMagicFormActor.EndDeferredKill()
		HarkonBattleMeleeFormActor.EndDeferredKill()
		;SelfActor.Kill()
		SelfActor.SetCriticalStage(SelfActor.CritStage_DisintegrateStart)
		Utility.Wait(1)
		AmbRumbleShake.Play(VQ08HarkonGroundMarker)
		Game.GetPlayer().RampRumble(1, 2, 1600)
		Game.ShakeCamera(SelfActor, 1, 2)
		SelfActor.PlaceAtMe(HarkonDeathExplosion)
		;Pull in the 'Real' Harkon and make him the ash pile, so the player doesn't lose any items
		;they may have reverse-pickpocketed onto him during the questline.
		;Wait for Harkon to collapse.
		Utility.Wait(4)
		HarkonBattleRealHarkonActor.GetActorBase().SetEssential(False)
		HarkonBattleRealHarkonActor.Kill()
		HarkonBattleRealHarkonActor.SetCriticalStage(HarkonBattleRealHarkonActor.CritStage_DisintegrateStart)
		HarkonBattleRealHarkonActor.MoveTo(VQ08HarkonGroundMarker)
		HarkonBattleRealHarkonActor.AttachAshPile(DLC1dunHarkonAshPile)
		HarkonBattleRealHarkonActor.SetCriticalStage(HarkonBattleRealHarkonActor.CritStage_DisintegrateEnd)
		HarkonBattleRealHarkonActor.Enable()
		Utility.Wait(10)
		;Finish dissolving Harkon.
		SelfActor.SetCriticalStage(SelfActor.CritStage_DisintegrateEnd)
		;Complete and shut down quest.
		DLC1VQ08.SetStage(200)
	EndIf
EndEvent
