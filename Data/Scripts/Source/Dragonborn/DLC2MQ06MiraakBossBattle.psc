ScriptName DLC2MQ06MiraakBossBattle extends ReferenceAlias
{This is the Main Fight Control Script for the Miraak Boss fight at the end of the DLC}

;This script is a bit of a beast so I tried to break it up into many smaller functions
;In general, the ProcessOnUpdateOROnHitEvent Function is the major update loop
;There are several times where the sprint or teleport functions wait for a bool to be true
;       These are set by the end of the scene they start or by the magic effect on the shout
;       A timer was added as a safety measure in case something went wrong
;       This was a pain to set up so tinker with it at your own peril
;The tentacle attacks that were originally part of the fight were disabled since it felt a bit too chaotic
;There are many properties like SelfActor and SelfRef, which might seem unnecessary
;       This is to cut down on unneeded casting for clarity and performance
;       better to cast it as an actor and store that once, then keep casting it over and over

;General Actor Properties
Quest property DLC2MQ06 Auto
Actor property SelfActor auto hidden
ObjectReference property SelfRef auto hidden
Actor property PlayerActor auto hidden
ActorBase property selfBase auto hidden
Actor property ActorDragon1 auto hidden
Actor property ActorDragon2 auto hidden
Actor property ActorDragon3 auto hidden
Faction Property DLC2TameDragonFaction auto
Actor property TameDragon auto hidden
ReferenceAlias property Dragon1 auto
ReferenceAlias property Dragon2 auto
ReferenceAlias property Dragon3 auto
ReferenceAlias property TameDragonAlias auto

;Initialization Properties
bool property scriptVariablesInitialized = false auto hidden
bool property initialized = false auto hidden
MusicType property DLC2MUSCombatBoss Auto
float property currentTime auto hidden

bool property isMounted auto hidden
int property DragonBeingRidden = 1 auto hidden
bool property DragonRiddenWasFlying auto hidden
bool property DragonRiddenIsFlying auto hidden
bool property Dragon1isFlying auto hidden
bool property Dragon2isFlying auto hidden
bool property Dragon3isFlying auto hidden
bool property Dragon1isDead = false auto hidden
bool property Dragon2isDead = false auto hidden
bool property Dragon3isDead = false auto hidden
int property playerPosition = 0 auto hidden     ;Didn't end up using this
{This property tells us where the player is, generally
        0 = Center
        1 = 2 o'clock
        2 = 3 o'clock
        3 = 5 o'clock
        4 = 7 o'clock
        5 = 9 o'clock
        6 = 11 o'clock}

;Dragon Markers
objectReference property DLC2MQ06DragonLandingMarkerFar auto
objectreference Property DLC2MQ06DragonKillLandingMarker002 auto
objectreference Property DLC2MQ06DragonKillLandingMarker003 auto
bool Property CanSprintInCombat = True auto
bool property TameDragonShouldNeverLand = True auto
bool property fireMiraakKill = false auto
{Default = true}
;--------------------------------------------------------------
;Initialization Block
;---------------------------------------

Function InitializeMiraakBattle() 
        if (!scriptVariablesInitialized)
;                 debug.Trace(self + ": INITIALIZING MIRAAK BATTLE")
                InitializeScriptVariables()
        EndIf
EndFunction

Function InitializeScriptVariables()
;         debug.Trace(self + ": Initializing Script Vars")
        SetMiraakCombatLevel()
        currentTime = Utility.GetCurrentRealTime()
        TentacleTimer = currentTime + TentacleTimeDelayInit
        TimeToSwapCombatStyle = currentTime + MaxTimeInMagicCombatStyle
        ;TimeOfLastTeleport = currentTime
        SelfActor = Self.GetActorRef()
        SelfActor.StartDeferredKill()
        selfBase = SelfActor.GetActorBase()
        SelfRef = (SelfActor as objectreference)
        PlayerActor = Game.GetPlayer() as Actor
        ActorDragon1 = Dragon1.GetActorRef()
        ActorDragon2 = Dragon2.GetActorRef()
        ActorDragon3 = Dragon3.GetActorRef()
        DLC2TameDragonOrbitMarker.moveto(SelfActor)
        SelfBase.SetEssential(False)
        SetRewardGear()
        ((Self as referenceAlias) as DLC2MiraakCombatMagicLevelingScript).SetMiraakCombatLevel()
        scriptVariablesInitialized = True
        tentacleController = (DLC2MQBossTentacleControllerRef as DLC2MQBossTentacleController)
        DLC2MiraakStreakE.Play(selfActor, -1)        
        ;sets mirakk fade speed
        selfActor.SetSubGraphFloatVariable("fDampRate", fadeSpeedFast) ;sets how fast miraak fades in and out
        CheckDragons()
        if TameDragonShouldNeverLand
             SetTameDragonCanLand(canLand = false)  
        endif 
EndFunction

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
        if (!initialized)
                initialized = True
                if (!scriptVariablesInitialized)
                        InitializeScriptVariables()
                EndIf
                currentTime = Utility.GetCurrentRealTime()
                ;TimeOfLastCombatStyleSwap = currentTime
                ;TimeOfLastTeleport = currentTime
;                 ;Debug.Trace("Start the music!")
                DLC2MUSCombatBoss.Add()
                GoToState("Ready")
                OnUpdate()

        EndIf
EndEvent
;--------------------------------------------------------------
;States Block
;--------------------------------------------------------------

;Normal Combat State
Auto State Ready
        Event onBeginState()
;                 Debug.Trace(self + ": Starting Ready State")
        EndEvent
        ;This is empty, but it uses the default onHit and ProcessOnUpdateOROnHitEvent
        ;Other states will clear these so they do not run.
EndState

;Busy State, in case needed
State Busy
        Event onBeginState()
;                 Debug.Trace(self + ": Starting Busy State")
        EndEvent
        Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
                ;Do Nothing
        EndEvent        
        Function ProcessOnUpdateOROnHitEvent(ObjectReference aggressor, Form weap)
                ;Do Nothing
        EndFunction
EndState

State Done
        Event onBeginState()
;                 Debug.Trace(self + ": Starting Done State")
        EndEvent
        Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
                ;Do Nothing
        EndEvent        
        Function ProcessOnUpdateOROnHitEvent(ObjectReference aggressor, Form weap)
                ;Do Nothing
        EndFunction
        Function OnUpdate()
                ;Do Nothing
        endFunction
EndState

State runningMiraakDeathState
        Event onBeginState()
;                 Debug.Trace(self + ": Starting runningMiraakDeathState State")
        EndEvent
        Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
                ;Do Nothing
        EndEvent        
        Function ProcessOnUpdateOROnHitEvent(ObjectReference aggressor, Form weap)
                ;Do Nothing
        EndFunction
        Function OnUpdate()
                if fireMiraakKill
                        goToState("Done")
                        MiraakDeath()
                else
                        RegisterForSingleUpdate(1)
                endif
        endFunction
endState
;--------------------------------------------------------------
;Main Battle Loops: OnHit and OnUpdate
;---------------------------------------

;Every second, we check to see if we need to update Miraaks's state.
Function OnUpdate()
        If !runningMiraakDeathEvent
                ProcessOnUpdateOROnHitEvent(None, None)
                RegisterForSingleUpdate(1)
        EndIf
EndFunction

;On hit, check to see which state we're in and respond accordingly.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
        ProcessOnUpdateOROnHitEvent(aggressor, weap)
EndEvent

;*****************************************************************************;
;We have to handle both types of events in this single function to prevent interleaving errors from asynchronus events.
;               This is where we kick off  all the events
;*****************************************************************************;
Function ProcessOnUpdateOROnHitEvent(ObjectReference aggressor, Form weap)
        if !runningMiraakDeathEvent
                GoToState("Busy")
        endif
        float healthPercentage = SelfActor.GetAVPercentage("Health")
        currentTime = Utility.GetCurrentRealTime()
        isMounted = game.getPlayer().IsOnMount()
        CurrentCombatStyle = DLC2MQ06MiraakCombatStyle.GetValue() as int
        ;If all three dragons are not dead, check dragons
        if !Dragon1isDead && !Dragon2isDead && !Dragon3isDead
                CheckDragons()
        endif
                
        If !scriptVariablesInitialized
                ;if we aren't initialized don't do anything
        elseif FightIsOver
                GoToState("runningMiraakDeathState")
        else
                if totalDragonsKilled == 0 && healthPercentage <= dragonDrainThreshold1 && !runningDragonKillEvent && !sprintBusy
                        runningDragonKillEvent = True
;                         debug.Trace(self + ": DRAGON KILL EVENT 1")
                        sprintBusy = True
                        RunDragonKillEvent()
                elseif totalDragonsKilled == 1  && healthPercentage <= dragonDrainThreshold2  && !runningDragonKillEvent && !sprintBusy
                        runningDragonKillEvent = True
;                         debug.Trace(self + ": DRAGON KILL EVENT 2")
                        sprintBusy = True
                        RunDragonKillEvent()
                elseif totalDragonsKilled == 2  && healthPercentage <= dragonDrainThreshold3  && !runningDragonKillEvent && !sprintBusy
                        runningDragonKillEvent = True
;                         debug.Trace(self + ": DRAGON KILL EVENT 3")
                        sprintBusy = True
                        RunDragonKillEvent()
                elseif totalDragonsKilled == 3 && healthPercentage <= finalKillThreshold  && !runningDragonKillEvent &&  !runningMiraakDeathEvent && !sprintBusy
                        runningMiraakDeathEvent = true
;                         debug.Trace(self + ": MIRAAK KILL EVENT")
                        sprintBusy = True
                        RunMiraakDeathEvent()
                ElseIf CanSprintInCombat && (aggressor == Game.GetPlayer()) && currentTime > (lastSprintTime + minTimebetweenSprints) && !sprintBusy && !runningDragonKillEvent &&  !runningMiraakDeathEvent && healthPercentage >= minSprintHealthThreshold
;                         ;Debug.Trace("Miraak:  Registered normal hit.")
                        TimerPreviousHit06 = TimerPreviousHit05
                        TimerPreviousHit05 = TimerPreviousHit04
                        TimerPreviousHit04 = TimerPreviousHit03
                        TimerPreviousHit03 = TimerPreviousHit02
                        TimerPreviousHit02 = TimerPreviousHit01
                        TimerPreviousHit01 = currentTime

                        if selfActor.getDistance(playerActor) < 1000 && (TimerPreviousHit01 - TimerPreviousHit06 < 8)
                                sprintBusy = True
                                SprintAway(pickClosest = false)
                                PickNewCombatStyle()
                        ElseIf selfActor.getDistance(playerActor) >= 1000 && (TimerPreviousHit01 - TimerPreviousHit04 < 6)
                                sprintBusy = True
                                SprintAway(pickClosest = true)
                                PickNewCombatStyle()
                        EndIf
                Endif
                ;If (!SelfActor.IsInCombat())
                ;        SelfActor.StartCombat(Game.GetPlayer())
                ;EndIf

                ;Make sure Miraak doesn't fall below ~50 health
                ;If he does he won't run his packages correctly
                if !runningMiraakDeathEvent
                        ;This should keep miraak above negative health
                        CheckMiraakHealthAndModIfNeeded()
                endif
                ;Combat Style Swap
                if !runningDragonKillEvent && !runningMiraakDeathEvent

                        if TimeToSwapCombatStyle <= currentTime && !IsMounted
;                                 debug.Trace(self + ": Timer up - Time To Swap Combat Style")
                                PickNewCombatStyle()
                        elseif IsMounted && DragonRiddenWasFlying != DragonRiddenIsFlying
;                                 debug.Trace(self + ": FlyingState change - Time To Swap Combat Style")
                                PickNewCombatStyle()
                        endif
                endif
                ;Check if it is okay to do tentacle attacks
                ;       okay = no alive dragons on the ground, and player not mounted
                ;We decided the tentacle attacks were too much, but they can be turned back on
                ;by setting the DoTentacleAttacks property to true
                if DoTentacleAttacks
                if Dragon1isFlying || Dragon1isDead
                if Dragon2isFlying || Dragon2isDead
                if Dragon3isFlying || Dragon3isDead
                if !isMounted && !runningMiraakDeathEvent && !runningDragonKillEvent
                        ;This is where we kick off tentacle attacks
                        if TentacleTimer <= currentTime ;&& "Player is on the ground"
;                                 debug.Trace(self + ": Time for Tentacle Attack")
                                int TargetArea = utility.randomInt(-1,6)
;                                 debug.Trace(self + ": Tentacle Target Area = " + TargetArea)
                                TriggerTentacleAttack(TargetArea)
                                TentacleTimer = currentTime + TentacleTimeDelay
                        endif
                EndIf
                EndIf
                endif 
                endif
                Endif
        endif
        if !runningMiraakDeathEvent && !runningDragonKillEvent    
                GoToState("Ready")
        endif
EndFunction

Function CheckDragons()
        bool TameDragonFound = false
        if !Dragon1isDead
                Dragon1isFlying = ActorDragon1.isFlying()
                if !TameDragonFound && ActorDragon1.IsInFaction(DLC2TameDragonFaction)
                        TameDragon = ActorDragon1
                        TameDragonFound = true
                EndIf
        EndIf
        if !Dragon2isDead
                Dragon2isFlying = ActorDragon2.isFlying()
                if !TameDragonFound && ActorDragon2.IsInFaction(DLC2TameDragonFaction)
                        TameDragon = ActorDragon2
                        TameDragonFound = true
                EndIf
        EndIf
        if !Dragon3isDead
                Dragon3isFlying = ActorDragon3.isFlying()
                if !TameDragonFound && ActorDragon3.IsInFaction(DLC2TameDragonFaction)
                        TameDragon = ActorDragon3
                        TameDragonFound = true
                EndIf
        EndIf
        if !TameDragonFound
                TameDragon = None
                DragonRiddenWasFlying = False
                DragonRiddenIsFlying = False
        else
                DragonRiddenWasFlying = DragonRiddenIsFlying
                DragonRiddenIsFlying = TameDragon.IsFlying()
        endif
        TameDragonAlias.ForceRefTo(TameDragon)
EndFunction

;--------------------------------------------------------------
;Dragon Kill Functions
;--------------------------------------------------------------
;Properties for Dragon Drain Events and overall combat Tracking
float property dragonDrainThreshold1 = 0.3 auto hidden
float property dragonDrainThreshold2 = 0.3 auto hidden
float property dragonDrainThreshold3 = 0.3 auto hidden
float property minSprintHealthThreshold = 0.5 auto hidden
float property finalKillThreshold = 0.1 auto hidden
int property totalDragonsKilled = 0 auto hidden
bool property runningDragonKillEvent = false auto hidden
bool property runningMiraakDeathEvent = false auto hidden
bool property FightIsOver = false auto hidden
spell property DLC2MiraakDragonKillSpell auto
Scene Property DLC2MQ06MiraakKillDragonScene  Auto  
ReferenceAlias Property DragonToKillAlias Auto
Actor Property DragonToKill auto hidden
spell property DLC2MiraakFakeShoutSpell auto
bool property waitingForDragonKillSceneToEnd auto hidden
bool property PreferToKillPlayerDragon = False auto
Quest Property DLC2TameDragon auto
;DLC2TameDragonScript is the script used
;       We call ReleaseDragon() when we kill the tamed dragon

Function MiraakStealsSoul()
;         debug.Trace(self + ": MIRAAK STEALS DRAGON SOUL")
        totalDragonsKilled += 1
        ; update MQ06 to use in conditions
        (GetOwningQuest() as DLC2MQ06Script).MiraakDragonsKilled = totalDragonsKilled
        selfActor.RestoreActorValue("health", 1000)
;         debug.Trace(self + ": END FIGHT DRAGONS KILLED = " + totalDragonsKilled)
endFunction

Function RunDragonKillEvent()
        ;int sceneWaitSafety = 0
        objectReference dragonKillLandingMarker
;         debug.Trace(self + ": RUNNING DRAGON KILL EVENT")
        ;Select which dragon we are going to kill
        PickDragonToKill()
;         debug.Trace(self + ": DragonToKill = " + DragonToKill)
        
        if totalDragonsKilled == 0
                dragonKillLandingMarker = DLC2MQ06DragonKillLandingMarker002
        ElseIf totalDragonsKilled == 1
                dragonKillLandingMarker = DLC2MQ06DragonKillLandingMarker003
        Elseif totalDragonsKilled == 2
                dragonKillLandingMarker = DLC2MQ06DragonLandingMarkerFar
        endif
        ;If this is the tamed dragon and the player is not riding it, release the dragon.
        if DragonToKill == TameDragon && !isMounted
                (DLC2TameDragon as DLC2TameDragonScript).ReleaseDragon()
        endif
        ; Set Dragon to Kill alias
        DragonToKill.SetForcedLandingMarker(dragonKillLandingMarker) 

        DragonToKill.SetAllowFlying(false) 
        SetDragonNoLand()
                ;;;;;;;;!!!!
                DragonToKill.StartDeferredKill()
                if DragonToKill.isflying()
                        DragonToKill.damageAV("health", 5000)
                endif
        DragonToKillAlias.ForceRefTo(DragonToKill)
        ;Move Miraak to safe room
        objectReference teleportAwayTarget = PickTeleportMarkerNearby()
        SelfActor.AddSpell(DLC2MiraakEtherealFXSpell)
        selfActor.SetGhost(true)
        SprintToTargetAndTeleportAway(teleportAwayTarget)
        
EndFunction

Function SetDragonNoLand()
        if !Dragon1isDead && ActorDragon1 != DragonToKill
                ActorDragon1.SetAV("Variable07", 1)
                ActorDragon1.EvaluatePackage()
        endif
        if !Dragon2isDead && ActorDragon2 != DragonToKill
                ActorDragon2.SetAV("Variable07", 1)
                ActorDragon2.EvaluatePackage()
        endif
        if !Dragon3isDead && ActorDragon3 != DragonToKill
                ActorDragon3.SetAV("Variable07", 1)
                ActorDragon3.EvaluatePackage()
        endif
endFunction

Function SetDragonsCanLand()
        if !Dragon1isDead && ActorDragon1 != TameDragon
                ActorDragon1.SetAV("Variable07", 0)
                ActorDragon1.EvaluatePackage()
        endif
        if !Dragon2isDead && ActorDragon1 != TameDragon
                ActorDragon2.SetAV("Variable07", 0)
                ActorDragon2.EvaluatePackage()
        endif
        if !Dragon3isDead && ActorDragon1 != TameDragon
                ActorDragon3.SetAV("Variable07", 0)
                ActorDragon3.EvaluatePackage()
        endif
endFunction

bool TameDragonCanLandCurrently
Function SetTameDragonCanLand(bool canLand = true)
        TameDragonCanLandCurrently = canLand
        if !TameDragon.isDead()
                if canLand
                        ActorDragon1.SetAV("Variable07", 0)
                else
                        ActorDragon1.SetAV("Variable07", 1)
                endif
                ActorDragon1.EvaluatePackage()   
        EndIf
endFunction

Actor Function PickDragonToKill()
        DragonToKill = NONE
        if PreferToKillPlayerDragon
                ;If we prefer to kill the player's dragon...
                DragonToKill = TameDragon
        elseif totalDragonsKilled < 2
                ;Pick a dragon that is not the player's tamed dragon
                if !Dragon1isDead && ActorDragon1 != TameDragon
                        DragonToKill = ActorDragon1
                elseif !Dragon2isDead  && ActorDragon2 != TameDragon
                        DragonToKill = ActorDragon2
                elseif  !Dragon3isDead  && ActorDragon3 != TameDragon
                        DragonToKill = ActorDragon3
                EndIf
        else ;There is only one dragon left, pick which ever it is
                if !Dragon1isDead ;&& ActorDragon1 != TameDragon
                        DragonToKill = ActorDragon1
                elseif !Dragon2isDead  ;&& ActorDragon2 != TameDragon
                        DragonToKill = ActorDragon2
                elseif  !Dragon3isDead  ;&& ActorDragon3 != TameDragon
                        DragonToKill = ActorDragon3
                EndIf
        endif
endFunction

Function DragonKillSceneEnded()
        waitingForDragonKillSceneToEnd = False
;         debug.Trace(self + ": Dragon Kill Scene has ended")
        if !DragonToKill.isDead()
                DragonToKill.EndDeferredKill()
                DragonToKill.damageAV("health", 10000)
        endif
        self.getActorRef().RemoveSpell(DLC2MiraakFakeShoutSpell)
        ;while !DragonToKill.isDead()
        ;        utility.wait(2.0)
        ;endwhile
        while selfActor.GetAVPercentage("health") < 0.9
                utility.wait(0.5)
        endwhile
        ;selfBase.SetEssential(True)
        selfActor.SetGhost(False)
        SelfActor.RemoveSpell(DLC2MiraakEtherealFXSpell)
        SetDragonsCanLand()
        runningDragonKillEvent = false
        GoToState("Ready")
endFunction

;This function tracks with dragons have already been killed
Function TrackDragonDeath(int DragonNumber)
;         Debug.trace(Self + "TrackDragonDeath >> DragonKilled = " + DragonNumber)
        if DragonNumber == 1
                Dragon1isDead = True
                if DragonToKill == ActorDragon1 && waitingForDragonKillSceneToEnd
                        DragonKillSceneEnded()
                EndIf
        elseif DragonNumber == 2
                Dragon2isDead = True
                if DragonToKill == ActorDragon2 && waitingForDragonKillSceneToEnd
                        DragonKillSceneEnded()
                EndIf
        elseif DragonNumber == 3
                Dragon3isDead = True
                if DragonToKill == ActorDragon3 && waitingForDragonKillSceneToEnd
                        DragonKillSceneEnded()
                EndIf
        endif
endFunction

;--------------------------------------------------------------
;Miraak Kill Functions
;--------------------------------------------------------------
;MiraakDeathSequence Properties
VisualEffect Property DragonAbsorbEffect Auto
VisualEffect Property DragonAbsorbManEffect Auto
sound property NPCDragonDeathSequenceWind auto
sound property NPCDragonDeathSequenceExplosion auto
EffectShader Property DragonPowerAbsorbFXS Auto
Spell Property DLC2KillMiraakSpell auto
GlobalVariable Property DLC2SoulStealCount  Auto  
objectReference property MQ06MiraakDeathMarker auto
idle property IdleDLC02MiraakDeathFinish auto
Armor Property DLC2MiraakSkeleton Auto ; miraaks skeleton for death fx
ObjectReference property DLC2MQ06CenterPoolRef auto
ObjectReference property DLC2MQ06CenterPoolFakeRef auto

VisualEffect Property DLC2MiraakAbsorbManE Auto ;..autofills
VisualEffect Property DLC2MiraakAbsorbE Auto ;...autofills


EffectShader Property DLC2MiraakBitsFXS Auto
EffectShader Property DLC2MiraakBitsLite2FXS Auto
EffectShader Property DLC2MiraakSmokeFXS Auto
EffectShader Property DLC2MiraakMagicFXS Auto
Armor Property DLC2MiraakSkinHider auto
Sound Property QSTMiraakDeathBurnMarker auto

Function RunMiraakDeathEvent()
        ;runningMiraakDeathEvent == True 
;         Debug.Trace(self + ": RunMiraakDeathEvent")
        GoToState("runningMiraakDeathState")
        ;Enable the fake water plane in the center and disable the real one
        ;Thjs is necessary for Miraak to be able to enter the furniture while under the platform
        ;DLC2MQ06CenterPoolFakeRef.enable(abFadeIn = false)
        ;DLC2MQ06CenterPoolRef.disable(abFadeout = True)
        objectReference teleportAwayTarget = PickTeleportMarkerNearby()
        SelfActor.AddSpell(DLC2MiraakEtherealFXSpell)
        selfActor.SetGhost(true)
        SprintToTargetAndTeleportAway(teleportAwayTarget)

endFunction

Event MiraakDeath()
;         Debug.Trace(self + ": MiraakDeath")
;       This is the bit that plays the absorb stuff, needed to move it up for Miraak
        ;display dragon absorb effect art. One part on dragon one part on player.
        ;mirak fades down
                DLC2MiraakBitsLite2FXS.Play(selfActor)
                utility.wait(1)
                selfActor.playSubgraphAnimation("SkinFadeOutLong")
                QSTMiraakDeathBurnMarker.Play(SelfActor)
                DLC2MiraakBitsFXS.Play(selfActor)            
                utility.wait(0.1)                               
                selfActor.playSubgraphAnimation("stage2")


                utility.wait(3)
                DLC2MiraakMagicFXS.Play(selfActor)   
                DLC2MiraakMagicFXS.Stop(selfActor)  
                utility.wait(3)
                selfActor.Playidle(IdleDLC02MiraakDeathFinish) 

                DLC2MiraakBitsLite2FXS.Stop(selfActor)
                DLC2MiraakBitsFXS.Stop(selfActor)
                DragonAbsorbEffect.Play(SelfActor, 8, PlayerActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
;;      dragonRef.placeAtME(MAGDragonPowerAbsorbExplosion)
        DragonAbsorbManEffect.Play(PlayerActor, 8, SelfActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
        NPCDragonDeathSequenceWind.play(SelfActor) 
        NPCDragonDeathSequenceExplosion.play(SelfActor) 
        utility.wait(1.0)
;;;;;;;;;;;;;Start of what actually kills Miraak;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;The Combat Spell Apllied here ends the Deferred Kill
        selfActor.SetGhost(false)
        ;equip the skin hider so we don't see bare hands & feet
                SelfActor.Equipitem(DLC2MiraakSkinHider)
        ;This is the spell that actually KILLS Miraak
        PlayerActor.doCombatSpellApply(DLC2KillMiraakSpell, selfActor)

        ;Tell the Tentacle furniture to finish playing and retract
        MQ06MiraakDeathMarker.PlayAnimation("TPlay02")
        ; Sounds for when the wispy particles being to fly at the player.
;;;;;;;;;THis is the end of the actual kill stuff   

                utility.wait(10)        
                DLC2MiraakSmokeFXS.Play(selfActor)   
                utility.wait(3) 
                DLC2MiraakSmokeFXS.Stop(selfActor)           
                utility.wait(2) 
                selfActor.playSubgraphAnimation("stage3")

        ;utility.wait(3.0)

        DLC2MUSCombatBoss.Remove()
        ;Make it rain!!! (souls)
        PlayerActor.ModActorValue("DragonSouls", 3 + DLC2SoulStealCount.GetValueInt() + totalDragonsKilled)
        DragonPowerAbsorbFXS.Stop(PlayerActor) ;***DLC2: CHANGED FROM GetPlayer() to AbsorbActor
endEvent
;--------------------------------------------------------------
;Fight Utility Functions
;---------------------------------------
;;;;;;;;;;;;;;;;CombatStyle Functions;;;;;;;;;;;;;;;;;;;;;

;Combat Style Properties
weapon property MiraakSword auto hidden
;weapon property DLC2MiraakApocryphaSword auto
weapon property MiraakStaff auto hidden
Spell Property DLC2LightningStormRightHand auto
objectreference property Sword1 auto hidden
objectreference property Staff auto hidden
objectreference property DLC2TameDragonOrbitMarker auto
float TimeToSwapCombatStyle = 0.0
float MaxTimeInMagicCombatStyle = 30.0
float MaxTimeInStaffCombatStyle = 10.0
float MaxTimeInMeleeCombatStyle = 30.0
GlobalVariable property DLC2MQ06MiraakCombatStyle auto
{This variable controls which combat style Miraak is using.
This is set via combat override Package.
It also is used to adjust his spells and equipment when changing combat style.
        0 = Staff
        1 = Magic (noStaff)
        2 = Melee
        3 = AntiAir (Kill Players flying Dragon)}
int property CurrentCombatStyle auto hidden

Function PickNewCombatStyle()
;         debug.Trace(self + ": Running SwapMiraakCombatStyle")
        CurrentCombatStyle = DLC2MQ06MiraakCombatStyle.GetValue() as int
        int NewCombatStyle = CurrentCombatStyle
        if isMounted && TameDragon && DragonRiddenIsFlying
                ChangeMiraakCombatStyle(3);Use AntiAir
        else
                ;Ensure we are using a new combat style
                While NewCombatStyle == CurrentCombatStyle
                        NewCombatStyle = utility.RandomInt(0,2)
                endWhile
                ChangeMiraakCombatStyle(NewCombatStyle)
        endif
endFunction

Function ChangeMiraakCombatStyle(int NewCombatStyle = 1)
;         debug.Trace(self + ": Running ChangeMiraakCombatStyle NewCombatStyle = " + NewCombatStyle)
        if NewCombatStyle == 0      ;Staff
                ;Set the global that changes his combat override packages
                DLC2MQ06MiraakCombatStyle.SetValue(0)
                ;Remove Spells & Equipment
                if Sword1
                        selfActor.removeItem(sword1)
                        SelfActor.UnequipItem(sword1)
                endif
                SelfActor.RemoveSpell(DLC2LightningStormRightHand)
                SelfActor.UnEquipSpell(DLC2LightningStormRightHand, 1)
                ;Add Spells & Equipment
                Staff = SelfActor.EquipItem(MiraakStaff)

                ;Reset the combat Timer
                TimeToSwapCombatStyle = currentTime + MaxTimeInStaffCombatStyle
        elseif NewCombatStyle == 1  ;Magic (NoStaff)
                ;Set the global that changes his combat override packages
                DLC2MQ06MiraakCombatStyle.SetValue(1)
                ;Remove Spells & Equipment
                if Sword1
                        SelfActor.UnequipItem(sword1)
                        selfActor.removeItem(sword1)
                endif
                if Staff
                        SelfActor.UnequipItem(Staff)
                        selfActor.removeItem(Staff)
                endif
                SelfActor.RemoveSpell(DLC2LightningStormRightHand)
                SelfActor.UnEquipSpell(DLC2LightningStormRightHand, 1)
                ;Add Spells & Equipment

                ;Reset the combat Timer
                TimeToSwapCombatStyle = currentTime + MaxTimeInMeleeCombatStyle
        elseif NewCombatStyle == 2  ;Melee
                ;Set the global that changes his combat override packages
                DLC2MQ06MiraakCombatStyle.SetValue(2)
                ;Remove Spells & Equipment
                SelfActor.RemoveSpell(DLC2LightningStormRightHand)
                SelfActor.UnEquipSpell(DLC2LightningStormRightHand, 1)
                if Staff
                        SelfActor.UnequipItem(Staff)
                        selfActor.removeItem(Staff)
                endif
                ;Add Spells & Equipment
                sword1 = SelfActor.EquipItem(MiraakSword)

                ;Reset the combat Timer
                TimeToSwapCombatStyle = currentTime + MaxTimeInMagicCombatStyle
        ElseIf NewCombatStyle == 3  ;AntiAir
                ;Set the global that changes his combat override packages
                DLC2MQ06MiraakCombatStyle.SetValue(3)
                ;Remove Spells & Equipment
                if Sword1
                        SelfActor.UnequipItem(sword1)
                        selfActor.removeItem(sword1)
                endif
                if Staff
                        SelfActor.UnequipItem(Staff)
                        selfActor.removeItem(Staff)
                endif
                ;Add Spells & Equipment
                SelfActor.AddSpell(DLC2LightningStormRightHand)

                ;Reset the combat Timer
                TimeToSwapCombatStyle = currentTime + 10.0
        Else
;                 debug.Trace(self + ": ChangeCombatStyle was passed invalid int >> " + NewCombatStyle)
        endif
        
        SelfActor.EvaluatePackage()
endFunction

Function CheckMiraakHealthAndModIfNeeded()
        float miraakHealth = selfActor.getActorValue("health")
        if miraakHealth < 10.0
                if miraakHealth < 0.0
                        miraakHealth = 0 - miraakHealth
                EndIf
                selfActor.RestoreActorValue("Health", 10.0 + miraakHealth)
        endif
EndFunction
;;;;;;;;;;;;;;;;End of CombatStyle Functions;;;;;;;;;;;;;;;;;;;;;


;Setting this inside the script to avoid interleaving errors
Function setPlayerPositionVariable(int newPosition)
        playerPosition = newPosition
endFunction

;;;;;;;;;;;;;;;;Sprint Functions;;;;;;;;;;;;;;;;;;;;;

;Whirlwind Sprint Properties
ReferenceAlias Property SprintTarget auto
Scene Property DLC2MQ06MiraakSprintScene auto
bool Property waitingForSprintSceneToEnd auto hidden
objectreference[] Property DLC2MQ06SprintTargets auto
Spell Property DLC2MiraakEtherealFXSpell auto

Function SprintAway(bool pickClosest = false)
        objectreference Target
        Target = PickSprintAwayTarget(pickClosest)
        ;FadeInSprintFX()
;         ;debug.Trace(self + ": Sprinting to Target= " + Target)
        SprintTarget.ForceRefTo(Target)
        SelfActor.AddSpell(DLC2MiraakEtherealFXSpell)
        selfActor.SetGhost(true)
        DLC2MQ06MiraakSprintScene.start()
endFunction


Function SprintToTarget(objectreference Target)
;         ;debug.Trace(self + ": Sprinting to Target= " + Target)   
        ;FadeInSprintFX()   
        ;utility.wait(0.2)
        int sceneWaitSafety = 0
        waitingForSprintSceneToEnd = True
        SprintTarget.ForceRefTo(Target)
        DLC2MQ06MiraakSprintScene.start()
        ;/
        While waitingForSprintSceneToEnd && sceneWaitSafety < 20
                utility.Wait(0.2)
;                 debug.Trace(self + ": Waiting for Sprint Scene To End >> " + sceneWaitSafety)
                sceneWaitSafety += 1
                CheckMiraakHealthAndModIfNeeded()
        endWhile
        /;
        ;FadeInSprintFX() 
endFunction

Function SprintToTargetAndTeleportAway(objectreference Target)
        int sceneWaitSafety = 0
;         debug.Trace(self + ": SprintToTargetAndTeleportAway Target= " + Target)
        teleportBusy = true
        SprintToTarget(Target)
        ;/
        waitingForSprintSceneToEnd = True
        While waitingForSprintSceneToEnd && sceneWaitSafety < 4
                utility.Wait(1.0)
;                 debug.Trace(self + ": Waiting for Sprint Scene To End >> " + sceneWaitSafety)
                sceneWaitSafety += 1
                CheckMiraakHealthAndModIfNeeded()
        endWhile
        /;
        ;TeleportAway()
endFunction

Function SprintSceneEnded()
        ;utility.wait(0.1)
        ;FadeOutSprintFX()
;         Debug.Trace(self + ": SprintSceneEnded")
        lastSprintTime = currentTime
        if waitingForSprintSceneToEnd
                waitingForSprintSceneToEnd = False
                TeleportAway()
        elseif !runningMiraakDeathEvent && !runningDragonKillEvent
                SelfActor.RemoveSpell(DLC2MiraakEtherealFXSpell)
                selfActor.SetGhost(false)
                waitingForSprintSceneToEnd = False
        endif
        sprintBusy = False
;         debug.Trace(self + ": Sprint Scene has ended")
endFunction

ObjectReference Function PickSprintAwayTarget(bool pickClosest = false)
        ObjectReference NewSprintTarget
        ;Identify the closest teleport point, offset from it +/-2, and go there.
        int closestPoint = 0
        int i = 0
        float ClosestDistance = 6000.0
        float Distance = 0.0
        float MinDistance = 2000.0
        int listLength = DLC2MQ06SprintTargets.Length - 1
;         Debug.Trace(self + "DLC2MQ06SprintTargets length = " + listLength)
        if pickClosest
                While (i < listLength)
                        Distance = playerActor.getDistance(DLC2MQ06SprintTargets[i])
                        if (Distance < ClosestDistance)
                                NewSprintTarget = DLC2MQ06SprintTargets[i]
                                ClosestDistance = Distance
                        EndIf
                        i = i + 1
                EndWhile
        else
                Distance = 0.0
                While Distance < MinDistance
                        i = utility.RandomInt(0, DLC2MQ06SprintTargets.Length)
                        NewSprintTarget = DLC2MQ06SprintTargets[i]
                        Distance = playerActor.getDistance(NewSprintTarget)
                EndWhile
        endif
        return NewSprintTarget
EndFunction



;;;;;;;;;;;;;;;;End of Sprint Functions;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;Teleport Functions;;;;;;;;;;;;;;;;;;;;;
;Teleport Properties
objectreference property DLC2MiraakFightTeleportMarkerMid auto
objectreference property DLC2MiraakFightTeleportMarker01 auto
objectreference property DLC2MiraakFightTeleportMarker02 auto
objectreference property DLC2MiraakFightTeleportMarker03 auto
objectreference property DLC2MiraakFightTeleportMarker04 auto
objectreference property DLC2MiraakFightTeleportMarker05 auto
objectreference property DLC2MiraakFightTeleportMarker06 auto
objectreference property DLC2MQ06FightFallTeleportMarker auto
objectreference property DLC2MQ06KillSceneFallTeleportMarker auto
FormList Property DLC2MQ06TeleportTargetFL auto
objectreference property DLC2MQ06MiraakSaferoom auto
Explosion Property DLC2MQ06MiraakTeleportExplosion auto
Explosion Property DLC2MiraakAwayExplosion auto
Explosion Property DLC2MiraakBackExplosion auto
Scene property DLC2MQ06PlayerFallRecoveryScene auto
Scene property DLC2MQ06MiraakFallRecoveryScene auto

;objectReference[] property TeleportPoints auto
;Static property MiraakTeleportMarker Auto

float fadeSpeedDefault = 0.03 ; this is the default value of fDampRate fades over about 2 seconds
float fadeSpeedFast = 0.05 ; about 1 second fade time

VisualEffect Property DLC2MiraakStreakE Auto ;streak art...autofills
bool teleportFromOffCliff = false
bool teleportBusy
Function TeleportMiraakFromOffCliff()
;         Debug.Trace(self + ": TeleportMiraakFromOffCliff>> ")
;         Debug.Trace("runningMiraakDeathEvent = " + runningMiraakDeathEvent + " > runningDragonKillEvent = " + runningDragonKillEvent)
        if !teleportBusy
                teleportFromOffCliff = true
                if runningMiraakDeathEvent && !SelfActor.isDead()
                        TeleportMiraak(DLC2MQ06KillSceneFallTeleportMarker)
                else
                        TeleportAway()
                endif
        endif
EndFunction

Function TeleportPlayerFromOffCliff()
;         Debug.Trace(self + ": TeleportPlayerFromOffCliff")
        game.GetPlayer().PlaceAtMe(DLC2MQ06MiraakTeleportExplosion)
        DLC2MQ06FightFallTeleportMarker.PlaceAtMe(DLC2MQ06MiraakTeleportExplosion)
        game.GetPlayer().MoveTo(DLC2MQ06FightFallTeleportMarker)
EndFunction

Function TeleportMiraak(objectReference teleportTarget)
;         Debug.Trace(self + ": TeleportMiraak to >> " + teleportTarget)
        teleportTarget.PlaceAtMe(DLC2MiraakBackExplosion)
        utility.wait(0.1)
        selfActor.moveto(teleportTarget)
        ;miraak fades up
        ;utility.wait(0.05)
        If !SelfActor.isDead()
                selfActor.playSubgraphAnimation("SkinFadeIn")
        endif
        teleportBusy = false
endFunction

Function TeleportAway()
;         Debug.Trace(self + ": TeleportAway>>")
;         Debug.Trace("runningMiraakDeathEvent = " + runningMiraakDeathEvent + " > runningDragonKillEvent = " + runningDragonKillEvent)
        teleportBusy = true
        selfActor.PlaceAtMe(DLC2MiraakAwayExplosion)
        selfActor.moveto(DLC2MQ06MiraakSaferoom)
        ;If we are in the MiraakDeathEvent move to the furniture and start the scene
        if runningMiraakDeathEvent
;                 Debug.Trace(self + ": TeleportAway >>> runningMiraakDeathEvent")
                selfActor.equipItem(DLC2MiraakSkeleton)
                SelfActor.RemoveSpell(DLC2MiraakEtherealFXSpell)
                DLC2MiraakStreakE.Stop(selfActor)
                SelfActor.Moveto(MQ06MiraakDeathMarker)
                DLC2MQ06.SetStage(500) 
                teleportBusy = false
        elseif runningDragonKillEvent
;                 Debug.Trace(self + ": TeleportAway >>> runningDragonKillEvent")
                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;!!!!
                while DragonToKill.isflying() && !DragonToKill.isDead()
                        utility.wait(1.0)
;                         debug.Trace(self + ": DragonKill waiting for landing")
                endWhile
                self.getActorRef().AddSpell(DLC2MiraakFakeShoutSpell)
                waitingForDragonKillSceneToEnd = True
                DLC2MQ06MiraakKillDragonScene.Start()
                TeleportMiraak(DLC2MiraakFightTeleportMarkerMid)
        elseif teleportFromOffCliff
;                 Debug.Trace(self + ": TeleportAway >>> teleportFromOffCliff")
                teleportFromOffCliff = false
                utility.Wait(0.2)
                TeleportMiraak(DLC2MQ06FightFallTeleportMarker)
                if !SelfActor.isDead()
                        DLC2MQ06MiraakFallRecoveryScene.Start()
                endif
                teleportBusy = false
        endif
EndFunction


Function TeleportPlayerToTarget(objectreference teleportTarget)
;         Debug.Trace(self + ": TeleportPlayerToTarget")
        teleportTarget.PlaceAtMe(DLC2MQ06MiraakTeleportExplosion)
        Game.getPlayer().moveto(teleportTarget)
        DLC2MQ06PlayerFallRecoveryScene.Start()
endFunction

ObjectReference Function PickTeleportMarkerNearby()
        ObjectReference closestMarker = Game.FindClosestReferenceOfAnyTypeInList(DLC2MQ06TeleportTargetFL, selfRef.getPositionX(), selfRef.getPositionY(), selfRef.getPositionZ(), 6000.0)
        if (closestMarker == None)
;                 Debug.Trace(self + ": Could not pick nearby Teleport point!!!")
        EndIf


        return closestMarker
EndFunction
;;;;;;;;;;;;;;;;End of Teleport Functions;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;Tentacle Attack Functions;;;;;;;;;;;;;;;;;;;;;
;The following functions are for talking to the tentacle attack controller
;Properties for Tentacle Controller
DLC2MQBossTentacleController property tentacleController auto hidden
objectreference property DLC2MQBossTentacleControllerRef auto
float property TentacleTimer auto hidden
float property TentacleTimeDelayInit = 15.0 auto hidden
float property TentacleTimeDelay = 15.0 auto hidden
bool property DoTentacleAttacks = false auto

Function TriggerTentacleAttack(int TargetArea)
        if TargetArea == -1      ;Attack FULL
                TriggerTentacleAttackFull(bClockwise = false, fAttackTimer = 0.5)
        elseif TargetArea >= 0 && TargetArea <= 6
                TriggerTentacleAttackSingle(TargetArea, bClockwise = false, fAttackTimer = 0.5)                            
        EndIf
EndFunction

Function TriggerTentacleAttackFull(bool bClockwise = false, float fAttackTimer = 0.5)
        ;Set properties then register for single update
        ;       RegisterForSingleUpdate is used to kick off new thread
        tentacleController.fullSweep = true
        tentacleController.clockwise = bClockwise
        tentacleController.attackTimer = fAttackTimer
        tentacleController.RegisterForSingleUpdate(0.1)
endFunction

Function TriggerTentacleAttackSingle(int itargetArea = 1, bool bClockwise = false, float fAttackTimer = 0.5)
        ;Set properties then register for single update
        ;       RegisterForSingleUpdate is used to kick off new thread
        tentacleController.targetArea = itargetArea
        tentacleController.clockwise = bClockwise
        tentacleController.attackTimer = fAttackTimer
        tentacleController.RegisterForSingleUpdate(0.1)
endFunction

;;;;;;;;;;;;;;;;Miraak Combat Leveling Function;;;;;;;;;;;;;;;;;;;;;
;Weapons

Int Property Stage1 = 37 Auto hidden
Int Property Stage2 = 44 Auto hidden
Int Property Stage3 = 51 Auto hidden  
Int Property Stage4 = 58 Auto hidden  
Int Property Stage5 = 65 Auto hidden  

Weapon Property DLC2MKMiraakFightSword1 auto
Weapon Property DLC2MKMiraakFightSword2 auto
Weapon Property DLC2MKMiraakFightSword3 auto
Weapon Property DLC2MKMiraakFightSword4 auto
Weapon Property DLC2MKMiraakFightSword5 auto
Weapon Property DLC2MKMiraakFightSword6 auto

Weapon Property DLC2MKMiraakFightStaff1 auto
Weapon Property DLC2MKMiraakFightStaff2 auto
Weapon Property DLC2MKMiraakFightStaff3 auto
Weapon Property DLC2MKMiraakFightStaff4 auto
Weapon Property DLC2MKMiraakFightStaff5 auto
Weapon Property DLC2MKMiraakFightStaff6 auto

Function SetMiraakCombatLevel()
        Actor miraak = GetActorRef()
        ;Pick the leveled gear that Miraak will use and store it
        if (miraak.GetLevel() >= Stage5)
                MiraakSword = DLC2MKMiraakFightSword6
                MiraakStaff = DLC2MKMiraakFightStaff6
        elseif (miraak.GetLevel() >= Stage4)
                MiraakSword = DLC2MKMiraakFightSword5
                MiraakStaff = DLC2MKMiraakFightStaff5
        ElseIf (miraak.GetLevel() >= Stage3)
                MiraakSword = DLC2MKMiraakFightSword4
                MiraakStaff = DLC2MKMiraakFightStaff4
        ElseIf (miraak.GetLevel() >= Stage2)
                MiraakSword = DLC2MKMiraakFightSword3
                MiraakStaff = DLC2MKMiraakFightStaff3
        ElseIf (miraak.GetLevel() >= Stage1)
                MiraakSword = DLC2MKMiraakFightSword2
                MiraakStaff = DLC2MKMiraakFightStaff2
        Else ;base gear
                MiraakSword = DLC2MKMiraakFightSword1
                MiraakStaff = DLC2MKMiraakFightStaff1
        EndIf
EndFunction

;;;;;;;;;;;;;;;;End Miraak Combat Leveling Function;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;Set Reward Gear Function;;;;;;;;;;;;;;;;;;;;;
        ;Ended up doing this thorough DeathItems but kept the old script here
        ;This function controls if we give the player light or heavy mask
GlobalVariable Property DLC2MQ06MaskHeavyChance auto
GlobalVariable Property DLC2MQ06MaskLightChance auto
Function SetRewardGear()
        if playerActor.getActorValue("Heavyarmor") > playerActor.getActorValue("LightArmor")
                DLC2MQ06MaskHeavyChance.SetValue(0)
                DLC2MQ06MaskLightChance.SetValue(100)
        else
                DLC2MQ06MaskLightChance.SetValue(0)
                DLC2MQ06MaskHeavyChance.SetValue(100)
        endif
EndFunction
Function SwapToRewardGear()
EndFunction
;;;;;;;;;;;;;;;;End Reward Gear Function;;;;;;;;;;;;;;;;;;;;;

;Hit Timestamps
float TimerPreviousHit01 = 0.0          ;Timestamps that record when the player hits Miraak with an attacked.
float TimerPreviousHit02 = 0.0          ;Used to approximately detect when he's been 'cornered' so he can escape.
float TimerPreviousHit03 = 0.0
float TimerPreviousHit04 = 0.0
float TimerPreviousHit05 = 0.0
float TimerPreviousHit06 = 0.0
float TimerOfRecord = 0.0                       ;Timer used to determine when Miraak was cornered.
float minTimebetweenSprints = 10.0
float lastSprintTime = 0.0
bool sprintBusy = false

ObjectReference Property MQ06MiraakDeathTeleportMarker  Auto  
