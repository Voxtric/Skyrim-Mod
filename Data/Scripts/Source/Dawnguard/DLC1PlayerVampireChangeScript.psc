Scriptname DLC1PlayerVampireChangeScript extends Quest  

float Property StandardDurationSeconds auto
{How long (in real seconds) the transformation lasts}

float Property DurationWarningTimeSeconds auto
{How long (in real seconds) before turning back we should warn the player}

float Property UnearthlyWillExtensionTimeSeconds auto
{How long (in real seconds) that feeding extends vampire time}

VisualEffect property FeedBloodVFX auto
{Visual Effect on Wolf for Feeding Blood}

Race Property VampireLordRace auto

Faction Property PlayerVampireFaction auto
;Faction Property VampireFaction auto

Message Property PlayerVampireExpirationWarning auto
Message Property PlayerVampireFeedMessage auto
GlobalVariable Property GameDaysPassed auto
GlobalVariable Property TimeScale auto
GlobalVariable Property PlayerVampireShiftBackTime auto
GlobalVariable Property DCL1VampireLevitateStateGlobal auto
{This Global tracks what state the Vampire Lord is in: 0 = Not a Vampire Lord,  1 = Walking, 2 = Levitating}

ImageSpaceModifier Property VampireWarn auto
ImageSpaceModifier Property VampireChange auto

Sound Property NPCVampireTransformation auto
Sound Property VampireIMODSound auto
Idle Property SpecialFeeding auto

Spell Property FeedBoost auto
Spell property BleedingFXSpell auto
{This Spell is for making the target of feeding bleed.}

	; Vampire should not need this wolf armor.
;Armor Property WolfSkinFXArmor auto

Quest Property VampireTrackingQuest auto

bool Property Untimed auto

FormList Property CrimeFactions auto
FormList Property VampireDispelList auto

;DLC1VampireShrineScript Property DLC1BloodMagicShrineRef auto
;DLC1VampireShrineScript Property DLC1NightPowerShrineRef auto

;stuff for the JP's ring/necklace quests
ARMOR PROPERTY beastRing Auto
GLOBALVARIABLE PROPERTY pDLC1nVampireRingBeast Auto
ARMOR PROPERTY eruditeRing Auto
GLOBALVARIABLE PROPERTY pDLC1nVampireRingErudite Auto
ARMOR PROPERTY batNecklace Auto
GLOBALVARIABLE PROPERTY pDLC1nVampireNecklaceBats Auto
ARMOR PROPERTY gargNecklace Auto
GLOBALVARIABLE PROPERTY pDLC1nVampireNecklaceGargoyle Auto

float __durationWarningTime = -1.0
float __UnearthlyWillExtensionTime = -1.0
bool __tryingToShiftBack = false
bool __shiftingBack = false
bool __shuttingDown = false
bool __trackingStarted = false
bool __prepped = false

float Function RealTimeSecondsToGameTimeDays(float realtime)
    float scaledSeconds = realtime * TimeScale.Value
    return scaledSeconds / (60 * 60 * 24)
EndFunction

float Function GameTimeDaysToRealTimeSeconds(float gametime)
    float gameSeconds = gametime * (60 * 60 * 24)
    return (gameSeconds / TimeScale.Value)
EndFunction

;Function SendShrinesIsPlayerVampireLord(bool IsPlayerVampireLord)
;{Sends information to shrines so when items are unequipped not to change the power if they are being force unequipped by this script}
;    DLC1BloodMagicShrineRef.PlayerIsVampireLord(IsPlayerVampireLord)
;    DLC1NightPowerShrineRef.PlayerIsVampireLord(IsPlayerVampireLord)
;EndFunction

Function PrepShift()
    Actor PlayerActor = Game.GetPlayer()
    Debug.Trace("VAMPIRE: Prepping shift...")
    ; screen effect
    VampireChange.Apply()
    VampireIMODSound.Play(PlayerActor)

    ; Turn off saves & waiting while we shift.
    Game.SetInCharGen(true, true, false)
    PlayerActor.AddPerk(DLC1VampireActivationBlocker)

    ; sets up the UI restrictions
    Game.SetBeastForm(True)
    Game.EnableFastTravel(False)

    ; set up perks/abilities
    PlayerActor.SetActorValue("GrabActorOffset", 70)


    ; get rid of your summons
    int count = 0
    while (count < VampireDispelList.GetSize())
        Spell gone = VampireDispelList.GetAt(count) as Spell
        if (gone != None)
            PlayerActor.DispelSpell(gone)
        endif
        count += 1
    endwhile

    Game.DisablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = true, abMenu = false, abActivate = false, abJournalTabs = false, aiDisablePOVType = 1)
    Game.ForceThirdPerson()
    Game.ShowFirstPersonGeometry(false)

    ;SendShrinesIsPlayerVampireLord(true)


    ; First, establish our leveled spells. The player cannot level up while
    ; a Vampire Lord so we only need to do this once.
    EstablishLeveledSpells()

    ; Preload the spells the player can equip.
    PreloadSpells()

    ; Indicate that we're finished prepping. This is used
    ; to prevent HandlePlayerLoadGame from calling Preload when we don't need it.
    __prepped = true;

EndFunction

Function InitialShift()
    Debug.Trace("VAMPIRE: Player beginning transformation.")
    actor PlayerActor = Game.GetPlayer()

    VampireWarn.Apply()

    if (PlayerActor.IsDead())
        Debug.Trace("VAMPIRE: Player is dead; bailing out.")
        return
    endif

    ; The player needs to be invulnerable and ghosted during the transition.
    ; We want to bracket the SetRace calls with this. OnRaceSwitchComplete
    ; in DLC1PlayerVampireScript will turn these off.
    PlayerActor.GetActorBase().SetInvulnerable( true )
    PlayerActor.SetGhost( true )

   ; actual switch
    PlayerActor.SetRace(VampireLordRace)
    PlayerActor.AddSpell(DLC1AbVampireFloatBodyFX, abVerbose = False)
EndFunction

Function StartTracking()
    actor PlayerActor = Game.GetPlayer()
    if (__trackingStarted)
        return
    endif

    __trackingStarted = true

    ;Vampire Necklace Ring stuff check is here
    if(game.getPlayer().isEquipped(beastRing))
        pDLC1nVampireRingBeast.setValue(1)
    endIf

    if(game.getPlayer().isEquipped(eruditeRing))
        pDLC1nVampireRingErudite.setValue(1)
    endIf

    if(game.getPlayer().isEquipped(batNecklace))
        pDLC1nVampireNecklaceBats.setValue(1)
    endIf

    if(game.getPlayer().isEquipped(gargNecklace))
        pDLC1nVampireNecklaceGargoyle.setValue(1)
    endIf

    ; Register for animation events now. This function is called after the race switch
    ; is complete, and the behavior graph changes during that time. If we register for
    ; events while the change is happening, one or more events might get un-registered
    ; when the player's behavior graph changes and we won't get events for it.
    ; You can check for this in OnAnimationEventUnregistered below.
    RegisterForEvents();

    DCL1VampireLevitateStateGlobal.SetValue(1)

    Debug.Trace("VAMPIRE: Race swap done; starting tracking and effects.")
    
    ; take all the player's stuff (since he/she can't use it anyway)
    PlayerActor.UnequipAll()
    PlayerActor.EquipItem(DLC1VampireLordArmor,  False, True)
;    PlayerActor.DrawWeapon()

    ;Add Blood Effects
    ;FeedBloodVFX.Play(PlayerActor)

    ; make everyone hate you
    PlayerActor.SetAttackActorOnSight(true)

    ; alert anyone nearby that they should now know the player is a vampire
    Game.SendWereWolfTransformation()

    PlayerActor.AddToFaction(PlayerVampireFaction)
;    PlayerActor.AddToFaction(VampireFaction)
    int cfIndex = 0
    while (cfIndex < CrimeFactions.GetSize())
        Debug.Trace("VAMPIRE: Setting enemy flag on " + CrimeFactions.GetAt(cfIndex))
        (CrimeFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy()
        cfIndex += 1
    endwhile
    HunterFaction.SetPlayerEnemy()

    ; but they also don't know that it's you
    Game.SetPlayerReportCrime(false)

    ; recalc times
    __durationWarningTime = RealTimeSecondsToGameTimeDays(DurationWarningTimeSeconds)
    __UnearthlyWillExtensionTime   = RealTimeSecondsToGameTimeDays(UnearthlyWillExtensionTimeSeconds)

    ; Remove vampire powers
    PlayerActor.RemoveSpell(VampireSunDamage01)
    PlayerActor.RemoveSpell(VampireSunDamage02)
    PlayerActor.RemoveSpell(VampireSunDamage03)
    PlayerActor.RemoveSpell(VampireSunDamage04)

    ; Add Vampire Lord Abilities
    PlayerActor.AddSpell(DLC1VampireLordSunDamage, false)
    PlayerActor.AddSpell(LeveledAbility, false)
    PlayerActor.AddSpell(VampireHuntersSight, false)

    ; Add the Revert spell
    PlayerActor.AddSpell(DLC1Revert, false)

    ; Add & equip Vampire Powers
    PlayerActor.AddSpell(DLC1VampireBats, false)
    PlayerActor.EquipSpell((DialogueGenericVampire as VampireQuestScript).LastPower, 2)
;    if PlayerActor.HasSpell(LeveledRaiseDeadSpell) == False
;        PlayerActor.AddSpell(LeveledRaiseDeadSpell, false)
;    endif

    CheckPerkSpells()
    if PlayerActor.HasPerk(Lightfoot) == true
        DLC1HasLightfoot = true
    else
        DLC1HasLightfoot = false
        PlayerActor.AddPerk(Lightfoot)
    endif

    ; calculate when the player turns back into a pumpkin
    float currentTime = GameDaysPassed.GetValue()
    float regressTime = currentTime + RealTimeSecondsToGameTimeDays(StandardDurationSeconds)
    if PlayerActor.HasPerk(DLC1UnearthlyWill)
        regressTime += __UnearthlyWillExtensionTime
    endif
    PlayerVampireShiftBackTime.SetValue(regressTime)
    Debug.Trace("VAMPIRE: Current day -- " + currentTime)
    Debug.Trace("VAMPIRE: Player will turn back at day " + regressTime)

    PlayerActor.DispelSpell(DLC1VampireChange)
    ; increment stats
    ; Game.IncrementStat("Vampire Transformations")

    ; set us up to check when we turn back
    RegisterForUpdate(3)

    SetStage(10) ; we're done with the transformation handling
EndFunction


Event OnUpdate()
    actor PlayerActor = Game.GetPlayer()

    ; Turn saves & waiting back on at our first 5-second update.
    ; Side effect here is that it'll be 5 seconds from the time the transformation
    ; is complete in order to save or wait.
    Game.SetInCharGen(false, false, false)

    Debug.Trace("VAMPIRE: Perks stat = " + Game.QueryStat("NumVampirePerks") )
    if Game.QueryStat("NumVampirePerks") >= DLC1VampireMaxPerks.Value
        Game.AddAchievement(58)
    endif

    if (Untimed)
        return
    endif

    ;/     This section has been replaced by the REVERT function
    float currentTime = GameDaysPassed.GetValue()
    ; fake to prevent automatic revert to human
    PlayerVampireShiftBackTime.value = currentTime + 1

    if PlayerActor.HasMagicEffect(DLC1RevertEffect) == true
        Debug.Trace("VAMPIRE: Revert effect detected")
        PlayerVampireShiftBackTime.Value = 0
    endif
    float regressTime = PlayerVampireShiftBackTime.GetValue()

    if (  (currentTime >= regressTime) && (!PlayerActor.IsInKillMove()) && !__tryingToShiftBack )
        UnregisterForUpdate()
        SetStage(100) ; time to go, buddy
        return
    endif
    /;

    if PlayerActor.HasMagicEffect(DLC1RevertEffect) == true && !PlayerActor.IsInKillMove() && !__tryingToShiftBack
        Debug.Trace("VAMPIRE: Revert effect detected")
        Revert()
    else
        ; safety net for if first person is forced.
        Game.ForceThirdPerson()
    endif

    ;/
    if (currentTime >= regressTime - __durationWarningTime)
        if (GetStage() == 10)
            SetStage(20)  ; almost there
            return
        endif
    endif
    /;

    ;Debug.Trace("VAMPIRE: Checking, still have " + GameTimeDaysToRealTimeSeconds(regressTime - currentTime) + " seconds to go.")

EndEvent

Function Revert()
    ; duplicated here so it isn't missed
    Debug.Trace("VAMPIRE: Perks stat = " + Game.QueryStat("NumVampirePerks") )
    if Game.QueryStat("NumVampirePerks") >= DLC1VampireMaxPerks.Value
        Game.AddAchievement(58)
    endif
    
    UnregisterForUpdate()
    SetStage(100) ; time to go, buddy
EndFunction

Function SetUntimed(bool untimedValue)
    Untimed = untimedValue
    if (Untimed)
        UnregisterForUpdate()
    endif
EndFunction

; called from stage 11
Function Feed(Actor victim)
;    float newShiftTime = PlayerVampireShiftBackTime.GetValue() + __feedExtensionTime
;    Game.GetPlayer().PlayIdle(SpecialFeeding)
    
    ;This is for adding a spell that simulates bleeding
;    BleedingFXSpell.Cast(victim,victim)
    
;    PlayerVampireShiftBackTime.SetValue(newShiftTime)
;    PlayerVampireFeedMessage.Show()
;    FeedBoost.Cast(Game.GetPlayer())
;    ; victim.SetActorValue("Variable08", 100)
;    Debug.Trace("VAMPIRE: Player feeding -- new regress day is " + newShiftTime)
;    SetStage(10)
EndFunction


; called from stage 20
Function WarnPlayer()
    ;Debug.Trace("VAMPIRE: Player about to transform back.")
    VampireWarn.Apply()
EndFunction


; called from stage 100
Function ShiftBack()
    __tryingToShiftBack = true
    actor PlayerActor = Game.GetPlayer()

    while (PlayerActor.GetAnimationVariableBool("bIsSynced"))
        ;Debug.Trace("VAMPIRE: Waiting for synced animation to finish...")
        Utility.Wait(0.1)
    endwhile
    ;Debug.Trace("VAMPIRE: Sending transform event to turn player back to normal.")

    __shiftingBack = false

    ActuallyShiftBackIfNecessary()

EndFunction

Event OnAnimationEvent(ObjectReference akActor, string akEventName)
    actor PlayerActor = Game.GetPlayer()
    Debug.Trace("VAMPIRE: Animation Event! " + akActor + " " + akEventName)
    if akActor == PlayerActor

        if (akEventName == TransformToHuman)
        	ActuallyShiftBackIfNecessary()
        endif

        If akEventName == BiteStart
            Debug.Trace("VAMPIRE: Handle BiteStart")
            DLC1VampireBloodPoints.Value += 1
    		If DLC1VampireTotalPerksEarned.Value < DLC1VampireMaxPerks.Value
    			DLC1BloodPointsMsg.Show()
    			Debug.Trace("VAMPIRE: Bite kill move, Blood " + DLC1VampireBloodPoints.value)
    			if DLC1VampireBloodPoints.Value >= DLC1VampireNextPerk.Value 
    				DLC1VampireBloodPoints.Value -= DLC1VampireNextPerk.Value
    				DLC1VampirePerkPoints.Value += 1
    				DLC1VampireTotalPerksEarned.Value += 1
    				DLC1VampireNextPerk.Value = DLC1VampireNextPerk.Value + 2
    				DLC1VampirePerkEarned.Show()
    ;				Debug.Trace("VAMPIRE: New perk (Blood points " + DLC1VampireBloodPoints.Value +", Next perk " + DLC1VampireNextPerk.Value + ", Perk pionts " + DLC1VampirePerkPoints.value + ")")
    			endIf
    			PlayerActor.SetActorValue("VampirePerks", DLC1VampireBloodPoints.Value / DLC1VampireNextPerk.Value*100)				
    		endif
    		if PlayerActor.HasPerk(DLC1VampireBite) == 1
    			PlayerActor.RestoreActorValue("Health", DLC1BiteHealthRecover)
    		endif
    		PlayerActor.SetActorValue("VampirePerks", DLC1VampireBloodPoints.Value / DLC1VampireNextPerk.Value*100)				
    ;		Debug.Trace("VAMPIRE: Actor value " + PlayerActor.GetActorValue("VampirePerks") + ")")
    		Game.IncrementStat( "Necks Bitten" )
    ;            we actually want the glow to stop playing at the begining of the landing anim.
        endif

        If akEventName == LandStart
            Debug.Trace("VAMPIRE: Handle LandStart")
            DCL1VampireLevitateStateGlobal.SetValue(1)
        endif

        If akEventName == Ground
           Debug.Trace("VAMPIRE: Handle GroundStart")
           DCL1VampireLevitateStateGlobal.SetValue(1)

            ; Save off the spell currently equipped in the left hand.
            CurrentEquippedLeftSpell = PlayerActor.GetEquippedSpell(0)
            debug.trace("VAMPIRE: saving equipped left spell " + CurrentEquippedLeftSpell)
            if ( CurrentEquippedLeftSpell != None )
                PlayerActor.UnequipSpell( CurrentEquippedLeftSpell, 0 )
            endif
            
            ; Now remove and unequip whatever spells are in the left & right hands.
            PlayerActor.UnequipSpell(LeveledDrainSpell, 1)
            PlayerActor.RemoveSpell(LeveledRaiseDeadSpell)
            PlayerActor.RemoveSpell(DlC1CorpseCurse)
            PlayerActor.RemoveSpell(DLC1VampiresGrip)
            PlayerActor.RemoveSpell(DLC1ConjureGargoyleLeftHand)

        endif

        If akEventName == LiftoffStart
;           we actually want the glow to start playing at the begining of the takoff anim.
            Debug.Trace("VAMPIRE: Handle LiftoffStart")
            DCL1VampireLevitateStateGlobal.SetValue(2)
        endif

        If akEventName == Levitate
            Debug.Trace("VAMPIRE: Handle LevitateStart")
            DCL1VampireLevitateStateGlobal.SetValue(2)

            ; Always equip a Vampire Drain in the right hand.
            PlayerActor.EquipSpell( LeveledDrainSpell, 1 )

            ; Now we'll re-equip whatever spell was previously eqiupped in the left hand.
            ; This was stored when we went to Ground. It'll be None the first time
            ; we transition, so we'll set it to the default Reanimate Corpse spell.
            ;debug.trace("VAMPIRE: CurrentEquippedLeftSpell = " + CurrentEquippedLeftSpell)
            If (DialogueGenericVampire as VampireQuestScript).LastLeftHandSpell == none
                (DialogueGenericVampire as VampireQuestScript).LastLeftHandSpell = DLC1VampireRaiseDeadLeftHand01
            EndIf
    		If CurrentEquippedLeftSpell == none
                CurrentEquippedLeftSpell = (DialogueGenericVampire as VampireQuestScript).LastLeftHandSpell
    			Debug.Trace("VAMPIRE: Spell from last session set as current last spell = " + CurrentEquippedLeftSpell)
    		EndIf

            ; Check to see if we need to add any perk-related spells.
            ; We need to do this here because the player may have added new perks since
            ; the last time.
            CheckPerkSpells()
            PlayerActor.AddSpell(LeveledRaiseDeadSpell, false)
            PlayerActor.EquipSpell(CurrentEquippedLeftSpell, 0)
            Debug.Trace("VAMPIRE: Last spell left eqiupped = " + CurrentEquippedLeftSpell)
            PlayerActor.EquipSpell(LeveledDrainSpell, 1)
            Debug.Trace("VAMPIRE: Last spell right eqiupped = " + LeveledDrainSpell)

       endIf
    endif
EndEvent

Function ActuallyShiftBackIfNecessary()
    actor PlayerActor = Game.GetPlayer()
    if (__shiftingBack)
        return
    endif

    __shiftingBack = true

    ; Make sure the player is invulnerable during the transition.
    PlayerActor.GetActorBase().SetInvulnerable(true)
    PlayerActor.SetGhost(true)
    if DLC1HasLightfoot == false
        PlayerActor.RemovePerk(Lightfoot)
    endif

    ; Unregister for animation events first, because if we don't we could get
    ; a Levitate event after we've set DLC1VampireLevitateStateGlobal to 1, and
    ; the value would be incorrect.
    UnregisterForEvents();

    DCL1VampireLevitateStateGlobal.SetValue(1)

    Debug.Trace("VAMPIRE: Player returning to normal.")

    Game.SetInCharGen(true, true, false)

    UnRegisterForUpdate() ; just in case

    if (PlayerActor.IsDead())
        Debug.Trace("VAMPIRE: Player is dead; bailing out.")
        return
    endif

    ;Remove Blood Effects
    ;FeedBloodVFX.Stop(Game.GetPlayer())

    ; imod
    VampireChange.Apply()
    VampireIMODSound.Play(PlayerActor)

    ;  We now add the effect with a long duration and remove it later.
    DLC1VampireChangeBackFXS.Play(PlayerActor,12.0)

    ; get rid of your summons if you have any
    int count = 0
    while (count < VampireDispelList.GetSize())
        Spell gone = VampireDispelList.GetAt(count) as Spell
        if (gone != None)
            ;Debug.Trace("VAMPIRE: Dispelling " + gone)
            PlayerActor.DispelSpell(gone)
        endif
        count += 1
    endwhile

    ; make sure the transition armor is gone
    ;Game.GetPlayer().UnequipItem(WolfSkinFXArmor, False, True)

    ; save CurrentEquippedLeftSpell (which is only used while vampire lord) - to allow script to reequip the same spell when returning to Vampire Lord form
    CurrentEquippedLeftSpell = PlayerActor.GetEquippedSpell(0)

    ; clear out perks/abilities
	(DialogueGenericVampire as VampireQuestScript).LastLeftHandSpell = CurrentEquippedLeftSpell
    if PlayerActor.GetEquippedSpell(2) == DLC1Revert
        (DialogueGenericVampire as VampireQuestScript).LastPower = DLC1VampireBats
    else
	   (DialogueGenericVampire as VampireQuestScript).LastPower = PlayerActor.GetEquippedSpell(2)
    endIf
    PlayerActor.RemoveSpell(LeveledDrainSpell)
    PlayerActor.RemoveSpell(LeveledAbility)
    PlayerActor.RemoveSpell(LeveledRaiseDeadSpell)

    PlayerActor.RemoveSpell(DLC1VampiresGrip)
    PlayerActor.RemoveSpell(DLC1ConjureGargoyleLeftHand)
    PlayerActor.RemoveSpell(DLC1CorpseCurse)
    PlayerActor.RemoveSpell(DLC1VampireDetectLife)
    PlayerActor.RemoveSpell(DLC1VampireMistForm)
    PlayerActor.RemoveSpell(DLC1VampireBats)
    PlayerActor.RemoveSpell(DLC1SupernaturalReflexes)
    PlayerActor.RemoveSpell(DLC1NightCloak)
    PlayerActor.RemoveSpell(DLC1Revert)
    PlayerActor.RemoveSpell(DLC1VampireLordSunDamage)

    ; You might want to add these spells to the VampireDispelList
    ; and then delete the next four DispelSpell lines.
    PlayerActor.DispelSpell(DLC1VampireDetectLife)
    PlayerActor.DispelSpell(DLC1VampireMistform)
    PlayerActor.DispelSpell(DLC1SupernaturalReflexes)
    PlayerActor.DispelSpell(DLC1Revert)
    PlayerActor.DispelSpell(VampireHuntersSight)

    PlayerActor.RemoveSpell(DLC1AbVampireFloatBodyFX)

    ;turn off all the vampire necklace/ring variables when we change back
    pDLC1nVampireNecklaceBats.setValue(0)
    pDLC1nVampireNecklaceGargoyle.setValue(0)
    pDLC1nVampireRingBeast.setValue(0)
    pDLC1nVampireRingErudite.setValue(0)

    ; Restore current stage vampirism:
    PlayerVampireQuest.VampireProgression(PlayerActor, PlayerVampireQuest.VampireStatus)

; PREVIOUSLY- just turned the player always into stage 4 vampire
;/
    VampireFeedReady.SetValue(3)
    PlayerActor.AddSpell(AbVampire04, abVerbose = False)
    PlayerActor.AddSpell(AbVampire04b, abVerbose = False)
    PlayerVampireQuest.VampireStatus = 4

    PlayerActor.RemoveSpell(VampireDrain01)
    PlayerActor.RemoveSpell(VampireDrain02)
    PlayerActor.RemoveSpell(VampireDrain03)		
    PlayerActor.AddSpell(VampireDrain04, abVerbose = False)		
    PlayerActor.RemoveSpell(VampireRaiseThrall01)
    PlayerActor.RemoveSpell(VampireRaiseThrall02)
    PlayerActor.RemoveSpell(VampireRaiseThrall03)
    PlayerActor.AddSpell(VampireRaiseThrall04, abVerbose = False)
    PlayerActor.RemoveSpell(VampireSunDamage01)
    PlayerActor.RemoveSpell(VampireSunDamage02)
    PlayerActor.RemoveSpell(VampireSunDamage03)
    PlayerActor.AddSpell(VampireSunDamage04, abVerbose = False)	
    PlayerActor.AddSpell(VampireInvisibilityPC, abVerbose = False)	
    PlayerActor.AddSpell(VampireCharm, abVerbose = False)	
;    PlayerActor.AddSpell(VampireHuntersSight, abVerbose = False)	
/;
    ;SendShrinesIsPlayerVampireLord(false)

    ; make sure your health is reasonable before turning you back
    ; PlayerActor.GetActorBase().SetInvulnerable(true)
    ;PlayerActor.SetGhost()
    float currHealth = PlayerActor.GetAV("health")
    if (currHealth <= 70)
        Debug.Trace("VAMPIRE: Player's health is only " + currHealth + "; restoring.")
        PlayerActor.RestoreAV("health", 70 - currHealth)
    endif

    ; change you back
    Debug.Trace("VAMPIRE: Setting race " + (VampireTrackingQuest as DLC1VampireTrackingQuest).PlayerRace + " on " + PlayerActor)
    PlayerActor.RemoveItem(DLC1VampireLordArmor, 2, true)
    PlayerActor.SetRace((VampireTrackingQuest as DLC1VampireTrackingQuest).PlayerRace)

    ;  We remove the Effect shader here now. And now we also try to book end it with another shader.
    DLC1VampireChangeBackFXS.stop(PlayerActor)
    DLC1VampireChangeBack02FXS.Play(PlayerActor,0.1)

    Game.ShowFirstPersonGeometry(true)

    ; <<TAKE BACK POWERS IF NECESSARY>>

    ; gimme back mah stuff
    ; We don't need to do this here. DLC1PlayerVampireScript.psc will restore
    ; all items previously equipped using the PopEquippedItems call.
    ; PlayerActor.EquipSpell(DLC1VampireChange, 2)	

    ; people don't hate you no more -- unless you're a stage 4 vampire
    ; CHANGE - nobody hates you when you're not a vampire lord
;    if PlayerVampireQuest.VampireStatus < 4
        PlayerActor.SetAttackActorOnSight(false)
        HunterFaction.SetPlayerEnemy(false)
        PlayerActor.RemoveFromFaction(PlayerVampireFaction)
;        PlayerActor.RemoveFromFaction(VampireFaction)
        int cfIndex = 0
        while (cfIndex < CrimeFactions.GetSize())
            ;Debug.Trace("VAMPIRE: Removing enemy flag from " + CrimeFactions.GetAt(cfIndex))
            (CrimeFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy(false)
            cfIndex += 1
        endwhile
 ;   endif

    ; and you're now recognized
    Game.SetPlayerReportCrime(true)

    ; alert anyone nearby that they should now know the player is a vampire
;    Game.SendWereWolfTransformation()

    ; give the set race event a chance to come back, otherwise shut us down
    Utility.Wait(5)
    Debug.Trace("OnRaceSwitchComplete event took more than 5 seconds, shutting down ourselves.")
;    Shutdown()

    ; MOVE THIS here to make sure it is the very last thing that happens
    ; using this to prevent recasting the vampire change until after the transform is completely done
    ; debug.trace("VAMPIRE: Transform to human done - remove activation blocking perk and allow recast of Vampire Change spell")
    ; PlayerActor.RemovePerk(DLC1VampireActivationBlocker)

EndFunction

Function Shutdown()
    if (__shuttingDown)
        return
    endif

    __shuttingDown = true
    actor PlayerActor = Game.GetPlayer()

    DCL1VampireLevitateStateGlobal.SetValue(0)

    ; Make sure the player is not still invulnerable or ghosted.
    PlayerActor.GetActorBase().SetInvulnerable(false)
    PlayerActor.SetGhost(false)

    Game.SetBeastForm(False)
    Game.EnableFastTravel(True)

    Game.SetInCharGen(false, false, false)
    ; MOVE THIS to end of ActuallyShiftBackIfNecessary so that it is guaranteed to be the very last thing that happens
    debug.trace("VAMPIRE: Transform to human done - remove activation blocking perk and allow recast of Vampire Change spell")
    PlayerActor.RemovePerk(DLC1VampireActivationBlocker)

    ; We always have to call this in Shutdown, or the spell loaded counts will
    ; get out of synch.
    PlayerActor.RemoveSpell(VampireHuntersSight)
    UnloadSpells();

    ; release the player controls
    ;Debug.Trace("VAMPIRE: Restoring camera controls")
    ; This was the last parameter of the EnablePlayerControls line below:   abLooking = false, abSneaking = false,
    Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = true, abMenu = false, abActivate = false, abJournalTabs = false, aiDisablePOVType = 1)

    Stop()
EndFunction

; Animation Events
String Property Ground = "GroundStart" Auto  
String Property Levitate = "LevitateStart" Auto  
String Property BiteStart = "BiteStart" Auto  
String Property LiftoffStart = "LiftoffStart" Auto
String Property LandStart = "LandStart" Auto  
String Property TransformToHuman = "TransformToHuman" Auto

; If you don't see events being processed, check the output from this function to see if 
; the event has been unregistered.
Event OnAnimationEventUnregistered(ObjectReference akSource, string asEventName)
    Debug.Trace( "Animation Event Unregistered for " + akSource + ": " + asEventName )
EndEvent

; Register for all of the animation events we care about.
Function RegisterForEvents()
    Debug.Trace( "Registering for Animation Events" )
    actor PlayerActor = Game.GetPlayer()
    RegisterForAnimationEvent(PlayerActor, Ground)
    RegisterForAnimationEvent(PlayerActor, Levitate)
    RegisterForAnimationEvent(PlayerActor, BiteStart)
    RegisterForAnimationEvent(PlayerActor, LiftoffStart)
    RegisterForAnimationEvent(PlayerActor, LandStart)
    RegisterForAnimationEvent(PlayerActor, TransformToHuman )
EndFunction

; Unregister for all of the animation events we registered for.
Function UnregisterForEvents()
    Debug.Trace( "Unregistering for Animation Events" )
    actor PlayerActor = Game.GetPlayer()
    UnRegisterForAnimationEvent(PlayerActor, Ground)
    UnRegisterForAnimationEvent(PlayerActor, Levitate)
    UnRegisterForAnimationEvent(PlayerActor, BiteStart)
    UnRegisterForAnimationEvent(PlayerActor, LiftoffStart)
    UnRegisterForAnimationEvent(PlayerActor, LandStart)
    UnRegisterForAnimationEvent(PlayerActor, TransformToHuman )
EndFunction

; This function figures out which Drain Spell and Vampire Ability the
; player should get as a Vampire Lord. It sets the properties LeveledDrainSpell and LeveledAbility.
Function EstablishLeveledSpells()
    actor PlayerActor = Game.GetPlayer()
    int playerLevel = PlayerActor.GetLevel()

    ; Establish the leveled Vampire Drain spell.
    if  (playerLevel <= 10)
        LeveledDrainSpell = DLC1VampireDrain05
        LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand01
    elseif (playerLevel <= 20)
        LeveledDrainSpell = DLC1VampireDrain06
        LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand02
    elseif (playerLevel <= 30)
        LeveledDrainSpell = DLC1VampireDrain07
        LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand03
    elseif (playerLevel <= 40)
        LeveledDrainSpell = DLC1VampireDrain08
        LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand04
    else
        LeveledDrainSpell = DLC1VampireDrain09
        LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand05
    endif

    ; Establish the Leveled Vampire Ability.
    if     (playerLevel <= 10)
        LeveledAbility = DLC1PlayerVampireLvl10AndBelowAbility
    elseif (playerLevel <= 15)
        LeveledAbility = DLC1PlayerVampireLvl15AndBelowAbility
    elseif (playerLevel <= 20)
        LeveledAbility = DLC1PlayerVampireLvl20AndBelowAbility
    elseif (playerLevel <= 25)
        LeveledAbility = DLC1PlayerVampireLvl25AndBelowAbility
    elseif (playerLevel <= 30)
        LeveledAbility = DLC1PlayerVampireLvl30AndBelowAbility
    elseif (playerLevel <= 35)
        LeveledAbility = DLC1PlayerVampireLvl35AndBelowAbility
    elseif (playerLevel <= 40)
        LeveledAbility = DLC1PlayerVampireLvl40AndBelowAbility
    elseif (playerLevel <= 45)
        LeveledAbility = DLC1PlayerVampireLvl45AndBelowAbility
    else
        LeveledAbility = DLC1PlayerVampireLvl50AndOverAbility
    endif
EndFunction

; Check to see if we need to add any perk-gated spells. We call this at the initial
; shift, and again when we enter Levitate mode. The latter because we may have
; additional perks since we first became a vampire lord.
Function CheckPerkSpells()
    actor PlayerActor = Game.GetPlayer()

    if PlayerActor.HasPerk(DLC1MistformPerk) == True && PlayerActor.HasSpell(DLC1VampireMistform) == False
       PlayerActor.AddSpell(DLC1VampireMistform, false)
    endif
    if PlayerActor.HasPerk(DLC1DetectLifePerk) == True && PlayerActor.HasSpell(DLC1VampireDetectLife) == False
       PlayerActor.AddSpell(DLC1VampireDetectLife, false)
    endif
    if PlayerActor.HasPerk(DLC1SupernaturalReflexesPerk) == True && PlayerActor.HasSpell(DLC1SupernaturalReflexes) == False
       PlayerActor.AddSpell(DLC1SupernaturalReflexes, false)
    endif
    if PlayerActor.HasPerk(DLC1VampiricGrip) == True && PlayerActor.HasSpell(DLC1VampiresGrip) == False
        PlayerActor.AddSpell(DLC1VampiresGrip, false)
    endif
    if PlayerActor.HasPerk(DLC1CorpseCursePerk) == True && PlayerActor.HasSpell(DLC1CorpseCurse) == False
        PlayerActor.AddSpell(DLC1CorpseCurse, false)
    endif
    if PlayerActor.HasPerk(DLC1GargoylePerk) == True && PlayerActor.HasSpell(DLC1ConjureGargoyleLeftHand) == False
        PlayerActor.AddSpell(DLC1ConjureGargoyleLeftHand, false)
    endif
    if PlayerActor.HasPerk(DLC1NightCloakPerk) == True && PlayerActor.HasSpell(DLC1NightCloak) == False
        PlayerActor.AddSpell(DLC1NightCloak, false)
    endif

EndFunction

; This function is called from DLC1PlayerVampireScript from the OnPlayerLoadGame event.
; Since the preloaded state of spells is not saved, we need to balance our Preload calls
; with Unload calls. This function 
Function HandlePlayerLoadGame()
    ; We only do this after PrepShift has finished. That way we avoid calls to this
    ; function before or while PrepShift is active, thereby avoiding calling PreloadSpells
    ; twice.
    if __prepped
        PreloadSpells()
    endif
EndFunction

; Preload all of the spells that could be equipped to the left or right hand. This will
; prevent a delay after EquipSpell before the casting art is loaded.
; This should be called when we start the script.
Function PreloadSpells()
    LeveledDrainSpell.Preload()
    LeveledRaiseDeadSpell.Preload()
    DLC1VampiresGrip.Preload()
    DLC1ConjureGargoyleLeftHand.Preload()
    DLC1CorpseCurse.Preload()
EndFunction

; Unload all of the spells the player could equip.
; This should be called when we shut the script down.
Function UnloadSpells()
    LeveledDrainSpell.Unload()
    LeveledRaiseDeadSpell.Unload()
    DLC1VampiresGrip.Unload()
    DLC1ConjureGargoyleLeftHand.Unload()
    DLC1CorpseCurse.Unload()
EndFunction

SPELL Property LeveledAbility Auto
SPELL Property DLC1PlayerVampireLvl10AndBelowAbility  Auto  
SPELL Property DLC1PlayerVampireLvl15AndBelowAbility  Auto  
SPELL Property DLC1PlayerVampireLvl20AndBelowAbility  Auto  
SPELL Property DLC1PlayerVampireLvl25AndBelowAbility  Auto  
SPELL Property DLC1PlayerVampireLvl30AndBelowAbility  Auto  
SPELL Property DLC1PlayerVampireLvl35AndBelowAbility  Auto  
SPELL Property DLC1PlayerVampireLvl40AndBelowAbility  Auto  
SPELL Property DLC1PlayerVampireLvl45AndBelowAbility  Auto  
SPELL Property DLC1PlayerVampireLvl50AndOverAbility  Auto  

Spell Property LeveledDrainSpell Auto
SPELL Property DLC1VampireDrain05  Auto  
SPELL Property DLC1VampireDrain06  Auto  
SPELL Property DLC1VampireDrain07  Auto  
SPELL Property DLC1VampireDrain08  Auto  
SPELL Property DLC1VampireDrain09  Auto  

SPELL Property DLC1VampireRaiseDeadLeftHand01  Auto  
SPELL Property DLC1VampireRaiseDeadLeftHand02  Auto  
SPELL Property DLC1VampireRaiseDeadLeftHand03  Auto  
SPELL Property DLC1VampireRaiseDeadLeftHand04  Auto  
SPELL Property DLC1VampireRaiseDeadLeftHand05  Auto  

SPELL Property DLC1VampiresGrip  Auto  
SPELL Property DLC1ConjureGargoyleLeftHand  Auto  
SPELL Property DLC1CorpseCurse  Auto  

SPELL Property DLC1VampireDetectLife  Auto  
SPELL Property DLC1VampireMistform  Auto  
SPELL Property DLC1VampireBats  Auto  
SPELL Property DLC1SupernaturalReflexes  Auto  

GlobalVariable Property DLC1BloodMagic  Auto  
GlobalVariable Property DLC1NightPower  Auto  

GlobalVariable Property DLC1VampireBloodPoints  Auto  
GlobalVariable Property DLC1VampirePerkPoints  Auto  
GlobalVariable Property DLC1VampireNextPerk  Auto  

Message Property DLC1BloodPointsMsg  Auto  

Perk Property DLC1VampireActivationBlocker  Auto  

Float Property DLC1BiteHealthRecover  Auto 

PlayerVampireQuestScript Property PlayerVampireQuest Auto

SPELL Property AbVampire01  Auto  
SPELL Property AbVampire02  Auto  
SPELL Property AbVampire03  Auto  
SPELL Property AbVampire04  Auto  

SPELL Property AbVampire01b  Auto  
SPELL Property AbVampire02b  Auto  
SPELL Property AbVampire03b  Auto  
SPELL Property AbVampire04b  Auto  

SPELL Property VampireSunDamage01  Auto  
SPELL Property VampireSunDamage02  Auto  
SPELL Property VampireSunDamage03  Auto  
SPELL Property VampireSunDamage04  Auto  

GlobalVariable Property VampireFeedReady  Auto  

SPELL Property VampireDrain01  Auto  
SPELL Property VampireDrain02  Auto  
SPELL Property VampireDrain03  Auto  
SPELL Property VampireDrain04  Auto  

SPELL Property VampireRaiseThrall01  Auto  
SPELL Property VampireRaiseThrall02  Auto  
SPELL Property VampireRaiseThrall03  Auto  
SPELL Property VampireRaiseThrall04  Auto  

SPELL Property VampireInvisibilityPC  Auto  
SPELL Property VampireCharm  Auto  
SPELL Property VampireHuntersSight  Auto  

SPELL Property DLC1AbVampireFloatBodyFX  Auto
	{Spell FX Art holder for Levitation Glow.}

Armor Property DLC1VampireLordArmor  Auto  

Message Property DLC1VampirePerkEarned  Auto  

GlobalVariable Property DLC1VampireMaxPerks  Auto  

SPELL Property DLC1VampireChange  Auto  

Perk Property DLC1UnearthlyWill  Auto  
Perk Property DLC1VampireBite  Auto  

Perk Property DLC1DetectLifePerk  Auto  
Perk Property DLC1MistFormPerk  Auto  
Perk Property DLC1SupernaturalReflexesPerk  Auto  

Perk Property DLC1CorpseCursePerk  Auto  
Perk Property DLC1GargoylePerk  Auto  
Perk Property DLC1VampiricGrip  Auto  

Spell Property CurrentEquippedLeftSpell  Auto  

Spell Property DLC1Revert  Auto
MagicEffect Property DLC1RevertEffect Auto

GlobalVariable Property DLC1VampireTotalPerksEarned  Auto  

EffectShader Property DLC1VampireChangeBackFXS Auto
EffectShader Property DLC1VampireChangeBack02FXS Auto


Perk Property LightFoot  Auto  

Bool Property DLC1HasLightfoot  Auto  

Faction Property HunterFaction  Auto  

Faction Property DLC1PlayerVampireLordFaction  Auto  

Quest Property DialogueGenericVampire  Auto  

SPELL Property DLC1NightCloak  Auto  

Perk Property DLC1NightCloakPerk  Auto  

SPELL Property DLC1VampireLordSunDamage  Auto  

SPELL Property LeveledRaiseDeadSpell  Auto  

