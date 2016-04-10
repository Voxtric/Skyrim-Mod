;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 46
Scriptname DLC1_QF_DLC1VQ07_01002853 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQ07Basin04Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Basin04Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07RNPCAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07RNPCAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07AurielsBowAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07AurielsBowAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07VyrthurAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07VyrthurAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07TempleBasinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07TempleBasinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07HoldingSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07HoldingSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07BowTriggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07BowTriggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07InitiatesEwerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07InitiatesEwerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Prelate02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Prelate02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Basin03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Basin03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Prelate04Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Prelate04Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Prelate00Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Prelate00Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Prelate03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Prelate03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07BalconyCollisionMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07BalconyCollisionMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07GeleborAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07GeleborAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Basin02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Basin02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Prelate01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Prelate01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Basin01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Basin01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ07Basin00Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ07Basin00Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Door to Sanctum has been activated/opened - head to Arch-Curate Vyrthur
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)
Game.EnableFastTravel()
Alias_DLC1VQ07InitiatesEwerAlias.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Big Fight with Arch-Curate Vyrthur!
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(100,1)
MM.DisengageFollowBehavior()
MM.IsWillingToWait = false
MM.CanBeDismissed = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Filling the Ewer at Wayshrine 01
pDLC1VQ07ShrineDone01.SetValue(1)
if ModObjectiveGlobal(1, pDLC1VQ07EwerFills, 70, pDLC1VQ07EwerTotal.value)
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Filling the Ewer at Wayshrine 02
if ModObjectiveGlobal(1, pDLC1VQ07EwerFills, 70, pDLC1VQ07EwerTotal.value)
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Enable Auriel's Bow (Chest for now) in the Wayshrine
MM.SimpleFollow = true
Alias_DLC1VQ07GeleborAlias.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(120,1)
SetObjectiveDisplayed(130,1)
;Fade in the bow on the pedestal
(Alias_DLC1VQ07BowTriggerAlias.GetReference() as DLC1AurielsBowActivateTrigSCRIPT).EnableBow()
; Blessed or blood arrows are not recoverable
Game.GetPlayer().AddPerk(DLC1AurielsArrowBlocker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Final attack on balcony - vampire powers akimbo!
Alias_DLC1VQ07BalconyCollisionMarker.GetReference().DisableNoWait()
Alias_DLC1VQ07VyrthurAlias.GetActorRef().SetGhost(false)
Alias_DLC1VQ07RNPCAlias.GetActorRef().SetGhost(false)
Game.EnablePlayerControls(true,true,true,true,true,true,true,true)
Alias_DLC1VQ07VyrthurAlias.GetActorRef().SetAv("Aggression",2)
Alias_DLC1VQ07VyrthurAlias.GetActorRef().StartCombat(Alias_DLC1VQ07RNPCAlias.GetActorRef())
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Filling the Ewer at Wayshrine 00
if ModObjectiveGlobal(1, pDLC1VQ07EwerFills, 70, pDLC1VQ07EwerTotal.value)
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;Open the Wayshrine
pDLC1Lightbeam01Ref.PlayAnimationAndWait("playanim01","EndAnim")
pDLC1VQ07Wayshrine01Ref.Activate(Alias_DLC1VQ07Prelate01Alias.GetActorRef())
utility.wait(5)
Game.EnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Filling the Ewer at Wayshrine 04
pDLC1VQ07ShrineDone04.SetValue(1)
if ModObjectiveGlobal(1, pDLC1VQ07EwerFills, 70, pDLC1VQ07EwerTotal.value)
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Exterior Wayshrine 02 Cleared
pDLC1VQ07Prelate02Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Open the Wayshrine
pDLC1Lightbeam00Ref.PlayAnimationAndWait("playanim01","EndAnim")
pDLC1VQ07Wayshrine00Ref.Activate(Alias_DLC1VQ07Prelate00Alias.GetActorRef())
utility.wait(5)
Game.EnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Exterior Wayshrine 03 Cleared
pDLC1VQ07Prelate03Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Gelebor starts his scene, also trigger the first wayshrine to rise
pDLC1VQ07GeleborScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
;Open the Wayshrine
pDLC1Lightbeam04Ref.PlayAnimationAndWait("playanim01","EndAnim")
pDLC1VQ07Wayshrine04Ref.Activate(Alias_DLC1VQ07Prelate04Alias.GetActorRef())
utility.wait(5)
Game.EnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Trigger at the end of Darkfall Passage Hit
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has entered the area with Gelebor, trigger to speak to him when within Forcegreet distance
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
MM.SimpleFollow = true
pDLC1VQ07GeleborCallOutScene.Start()
Alias_DLC1VQ07RNPCAlias.GetActorRef().MoveTo(DLC1VQ07SeranaDFCOverrideMarker)
Alias_DLC1VQ07RNPCAlias.GetActorRef().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;All four wayshrines have been purified and the Ewer filled - pointing at the Chantry Sanctum now
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(80,1)
Alias_DLC1VQ07GeleborAlias.GetActorRef().Disable()
Alias_DLC1VQ07GeleborAlias.GetActorRef().MoveTo(pDLC1VQ07GeleborFinalMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;Open the Wayshrine inside Darkfall Cave
pDLC1WayshrineBeamDarkfallRef.PlayAnimationAndWait("playanim01","EndAnim")
pDLC1VQ07DarkfallWayshrine01Ref.Activate(Alias_DLC1VQ07GeleborAlias.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Exterior Wayshrine 04 Cleared
pDLC1VQ07Prelate04Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;RNPC has hit the first Trigger - Start the MiniScene where she runs ahead
;Game.EnablePlayerControls(true,false,true,true,false,false,false,true)
pDLC1VQ07FinalPreScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;RNPC reached end of the last scene - fire longer end scene
pDLC1VQ07FinalScene.Start()
pDLC1AlthadanVyrthur.SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Vyrthur dealt with - enable last wayshrine and Gelebor on balcony
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)
Alias_DLC1VQ07RNPCAlias.GetActorRef().RestoreAV("health", 10000)
Game.EnableFastTravel(false)
utility.wait(5)
pDLC1VQ07BalconyWayshrineRef.Activate(Alias_DLC1VQ07GeleborAlias.GetActorRef())
utility.wait(5)
Game.EnableFastTravel()
Alias_DLC1VQ07GeleborAlias.GetActorRef().Enable()
Alias_DLC1VQ07GeleborAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player is seeking the Elder Scrolls within Darkfall Cave
Alias_DLC1VQ07GeleborAlias.GetActorRef().Enable()
SetObjectiveDisplayed(20,1)
pDLC1VQ07PreQuestDisabler.Disable()

MM.EngageFollowBehavior()
MM.IsWillingToWait = false
MM.CanBeDismissed = true
MM.SetHomeMarker(-1, SeranaWaitSpot)

DLC1VQ07RNPC.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Filling the Ewer at Wayshrine 03
pDLC1VQ07ShrineDone03.SetValue(1)
if ModObjectiveGlobal(1, pDLC1VQ07EwerFills, 70, pDLC1VQ07EwerTotal.value)
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;End
Game.GetPlayer().AddSpell(DLC1abAurielsBow)
Game.GetPlayer().AddItem(ElvenArrow, 12)
Game.GetPlayer().AddItem(DLC1ElvenArrowBlessed, 12)
pDLC1VQ07BalconyWayshrineRef.Activate(pDLC1VQ07BalconyWayshrineRef)

DLC1ArrowsAvailable.SetValue(0)

CompleteAllObjectives()
pDLC1VQ07Post.Start()
MM.SimpleFollow = false
MM.Unlock()
MM.EngageFollowBehavior()
MM.IsWillingToWait = true
MM.CanBeDismissed = true
DLC1VQ07RNPC.Stop()
utility.wait(5)
pDLC1VQ08.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Fast Start
Game.GetPlayer().Moveto(pDLC1VQ07PlayerStart)
Alias_DLC1VQ07RNPCAlias.GetActorRef().MoveTo(pDLC1VQ07RNPCStart)
Alias_DLC1VQ07RNPCAlias.GetActorRef().EvaluatePackage()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Player is seeking the Elder Scrolls within Darkfall Cave
Alias_DLC1VQ07GeleborAlias.GetActorRef().Enable()
SetObjectiveDisplayed(20,1)
pDLC1VQ07PreQuestDisabler.Disable()

MM.EngageFollowBehavior()
MM.IsWillingToWait = false
MM.CanBeDismissed = true
MM.SetHomeMarker(-1, SeranaWaitSpot)

DLC1VQ07RNPC.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;jduvall-- this is used to make an attack on the player in the wilderness for the next wilderness encounter and increase the rate at which these occur
DLC1Radiant.SetDLC1WENextSpecialAttackDay(ForceNextWildernessEncounter = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;Open the Wayshrine
pDLC1Lightbeam02Ref.PlayAnimationAndWait("playanim01","EndAnim")
pDLC1VQ07Wayshrine02Ref.Activate(Alias_DLC1VQ07Prelate02Alias.GetActorRef())
utility.wait(5)
Game.EnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Exterior Wayshrine 00 Cleared
pDLC1VQ07Prelate00Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Vyrthur is waiting on the balcony now for the end stuff
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player proceeds to Darkfall Passage
Alias_DLC1VQ07RNPCAlias.GetActorRef().SetPlayerTeammate()
MM.SimpleFollow = false
pDLC1VQ07DarkfallWayshrine01Ref.activate(pDLC1VQ07DarkfallWayshrine01Ref)
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;Temple Front Controller
utility.wait(3)
(pDLC1WaterChannelsRef as DLC1VQ07WaterChannelsScript).EventStaging()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Open the Wayshrine
pDLC1Lightbeam03Ref.PlayAnimationAndWait("playanim01","EndAnim")
pDLC1VQ07Wayshrine03Ref.Activate(Alias_DLC1VQ07Prelate03Alias.GetActorRef())
utility.wait(5)
Game.EnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Exterior Wayshrine 01 Cleared
pDLC1VQ07Prelate01Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC1VQ07ShrineDone01  Auto  

GlobalVariable Property pDLC1VQ07ShrineDone02  Auto  

GlobalVariable Property pDLC1VQ07ShrineDone03  Auto  

GlobalVariable Property pDLC1VQ07ShrineDone04  Auto  

GlobalVariable Property pDLC1VQ07EwerFills  Auto  

GlobalVariable Property pDLC1VQ07EwerTotal  Auto  

Quest Property pDLC1VQ08  Auto  

ObjectReference Property pDLC1VQ07PlayerStart  Auto  

Scene Property pDLC1VQ07GeleborScene  Auto  

ObjectReference Property pDLC1VQ07PreQuestDisabler  Auto  

ObjectReference Property pDLC1VQ07GeleborFinalMarker  Auto  

ActorBase Property pDLC1AlthadanVyrthur  Auto  

ObjectReference Property pDLC1VQ07RNPCStart  Auto  

Scene Property pDLC1VQ07GeleborCallOutScene  Auto  

Scene Property pDLC1VQ07Prelate01Scene  Auto  

Scene Property pDLC1VQ07Prelate02Scene  Auto  

Scene Property pDLC1VQ07Prelate03Scene  Auto  

Scene Property pDLC1VQ07Prelate04Scene  Auto  

Scene Property pDLC1VQ07FinalScene  Auto  

Scene Property pDLC1VQ07FinalPreScene  Auto  

Quest Property pDLC1VQ07Post  Auto  

ObjectReference Property pDLC1VQ07DoorToTempleRef  Auto  

Quest Property DLC1VQ07RNPC  Auto  

DLC1_NPCMentalModelScript Property MM Auto

ObjectReference Property pDLC1VQ07Wayshrine01Ref  Auto  

ObjectReference Property pDLC1VQ07Wayshrine02Ref  Auto  

ObjectReference Property pDLC1VQ07Wayshrine03Ref  Auto  

ObjectReference Property pDLC1VQ07Wayshrine04Ref  Auto  

ObjectReference Property pDLC1VQ07DarkfallWayshrine01Ref  Auto  

Perk Property DLC1AurielsArrowBlocker  Auto  

ObjectReference Property pDLC1VQ07BalconyWayshrineRef  Auto  

Scene Property pDLC1VQ07Prelate00Scene  Auto  

ObjectReference Property pDLC1VQ07Wayshrine00Ref  Auto  

ObjectReference Property DLC1VQ07SeranaDFCOverrideMarker  Auto  

dlc1radiantscript Property DLC1Radiant  Auto  

ObjectReference Property pDLC1WayshrineBeamDarkfallRef  Auto  

ObjectReference Property pDLC1WaterChannelsRef  Auto  

ObjectReference Property pDLC1VQ07TempleBasinRef  Auto 

ObjectReference Property pDLC1TempleDoorLightLowerRef  Auto  

ObjectReference Property pDLC1TempleDoorLightUpperRef  Auto  

ObjectReference Property pDLC1Lightbeam00Ref  Auto  

ObjectReference Property pDLC1Lightbeam01Ref  Auto  

ObjectReference Property pDLC1Lightbeam02Ref  Auto  

ObjectReference Property pDLC1Lightbeam03Ref  Auto  

ObjectReference Property pDLC1Lightbeam04Ref  Auto  

Scene Property pDLC1VQ07FinalSceneAlternate  Auto  

SPELL Property DLC1AbAurielsBow  Auto  

Ammo Property ElvenArrow  Auto  

Ammo Property DLC1ElvenArrowBlessed  Auto  

ActorBase Property pDLC1Serana  Auto 

GlobalVariable Property pDLC1VQ07BalconyScene  Auto  

GlobalVariable Property DLC1ArrowsAvailable  Auto  

ActorBase Property pDLC1Dexion  Auto  

ObjectReference Property SeranaWaitSpot  Auto  
