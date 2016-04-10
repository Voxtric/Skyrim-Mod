;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 62
Scriptname DLC1_QF_DLC1LD_Bthalft_0100CFFF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Katria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Katria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forgemaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Forgemaster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BthalftExteriorPedestal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BthalftExteriorPedestal Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Callback from crafting.
;Shut down the steam.
(AetheriumForgeFurniture as DLC1LD_AetheriumForge).DisableSteam()

;Trigger Katria final forcegreet.
if (DLC1LD.GetStageDone(130))
     Alias_Katria.GetActorRef().EvaluatePackage()
Else
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Katria tells the player to use the Forge.
DLC1LD.SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
;Turn on the collision at the top of the Forge stairs.
ForgeStairTopCollision.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;Reactivate the steam.
Utility.Wait(12)
if (!GetStageDone(75))
     (DLC1LD_FXSteamCenter as DLC1LD_BthalftSteamManagerScript).EnableSteam()
     (DLC1LD_FXSteamLeft as DLC1LD_BthalftSteamManagerScript).EnableSteam()
     (DLC1LD_FXSteamRight as DLC1LD_BthalftSteamManagerScript).EnableSteam()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Wait 5s, then if the Forgemaster is still active, reaactivate the steam.
Utility.Wait(5)
if (!GetStageDone(75))
     if (DLC1LD.GetStageDone(130))
          if (Alias_Katria.GetActorRef().IsDisabled())
               (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
          EndIf
          DLC1LD_Katria_Forge06b.Start()
     Else
          SetStage(62)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Spider Phase 1 complete.

;Spider Phase 2 begins and continues for the rest of the battle.
ObjectReference currentLink = (SpiderManager2 as dunProgressiveCombatScript).BattleManager
While (currentLink != None)
     currentLink.GetLinkedRef(LinkCustom01).Enable(False)
     currentLink = currentLink.GetLinkedRef()
EndWhile
(SpiderManager2 as dunProgressiveCombatScript).Activate(SpiderManager2)

;Begin the sphere phase of the battle.
;Activate three spheres initially. Both come from the Battle Manager.
currentLink = (SphereManager as dunProgressiveCombatScript).BattleManager
While (currentLink != None)
     currentLink.GetLinkedRef(LinkCustom01).Enable(False)
     currentLink = currentLink.GetLinkedRef()
EndWhile
(SphereManager as dunProgressiveCombatScript).Activate(SphereManager)

;Allow the spheres to open their gates when they need to get out.
SphereGateTrigger01.Enable()
SphereGateTrigger02.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Tower has finished rising.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;Open the sphere doors when one of the spheres hits its door trigger.
SphereGate1.SetOpen()
SphereGate2.SetOpen()

;Katria shouts a warning.
if (DLC1LD.GetStageDone(130))
     if (Alias_Katria.GetActorRef().IsDisabled())
          (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
     EndIf
     DLC1LD_Katria_Forge04.Start()
EndIf

;Wait 10s, then start the steam.
Utility.Wait(10)
SetStage(57)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest starts when you approach Bthalft after finding all four shards.

;Move Katria to Bthalft, bringing her under the control of this quest.
if (DLC1LD.GetStageDone(130))
     Alias_Katria.GetActorRef().Disable()
     Alias_Katria.GetActorRef().MoveTo(KatriaBthalftExteriorMarker)
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = False
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
     Alias_Katria.GetActorRef().EvaluatePackage()
     Alias_Katria.GetActorRef().SetGhost(False)
     DLC1LD.SetStage(160)
EndIf

;Disable the Forgemaster
Alias_Forgemaster.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Sphere Phase 1 complete.
;Debug.Trace("Stage 60 set")

;Sphere Phase 2 begins and continues for the rest of the battle.
;(SphereManager2 as dunProgressiveCombatScript).Activate(SphereManager2)

;Enable and activate the Forgemaster.
(Alias_Forgemaster as DLC1LD_ForgemasterBossBattle).StartForgemaster()
Alias_Forgemaster.GetActorRef().StartCombat(Game.GetPlayer())

;Rumble, shake, major dust drop.
AmbRumbleShake.Play(Game.GetPlayer())
Game.GetPlayer().RampRumble(1, 2, 1600)
Game.ShakeCamera(None, 0.75, 2)
MUSDread.Add()
ForgeDustFX[4].OnActivate(Game.GetPlayer())
ForgeDustFX[10].OnActivate(Game.GetPlayer())
ForgeDustFX[15].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[8].OnActivate(Game.GetPlayer())
ForgeDustFX[1].OnActivate(Game.GetPlayer())
Utility.Wait(0.2)
ForgeDustFX[12].OnActivate(Game.GetPlayer())
ForgeDustFX[6].OnActivate(Game.GetPlayer())
ForgeDustFX[9].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[13].OnActivate(Game.GetPlayer())
Utility.Wait(0.3)
ForgeDustFX[0].OnActivate(Game.GetPlayer())
ForgeDustFX[3].OnActivate(Game.GetPlayer())
ForgeDustFX[1].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[11].OnActivate(Game.GetPlayer())
ForgeDustFX[14].OnActivate(Game.GetPlayer())

;Wait a moment.
Utility.Wait(2)

;Katria, if present, notices the Forgemaster. Otherwise, just pop the objective.
if (DLC1LD.GetStageDone(130))
     if (Alias_Katria.GetActorRef().IsDisabled())
          (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
     EndIf
     DLC1LD_Katria_Forge06.Start()
     SetStage(61)
Else
     SetStage(61)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;Player interacts with the Aetherium Crest. Enable Stand Clear Trigger.
BthalftStandClearTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
;Display objective to shut down the steam.
DLC1LD.SetStage(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Trigger strong rumble.
(RumbleManager as DLC1LD_TowerRumbleShakeManager).Activate(Game.GetPlayer())

;Trigger the tower to rise.
DLC1LD_BthalftElevatorMarker.Enable()
DLC1LD_BthalftExteriorNavcutCollisionMarker.Enable()
DLC1LD.SetStage(186)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Forgemaster defeated.
DLC1LD.SetStage(210)

;Enable the forge furniture.
AetheriumForgeFurniture.Enable()

;Trigger Katria's scene.
if (DLC1LD.GetStageDone(130))
     if (Alias_Katria.GetActorRef().IsDisabled())
          (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeInNoWait()
     EndIf
     DLC1LD_Katria_Forge07.Start()
EndIf

;Shut off the steam.
(DLC1LD_FXSteamCenter as DLC1LD_BthalftSteamManagerScript).DisableSteam()
(DLC1LD_FXSteamLeft as DLC1LD_BthalftSteamManagerScript).DisableSteam()
(DLC1LD_FXSteamRight as DLC1LD_BthalftSteamManagerScript).DisableSteam()
(DLC1LD_FXSteamForge as DLC1LD_BthalftSteamManagerScript).DisableSteam()

;Disable the steam valves to prevent the player from activating them again post-battle.
(ValveLeft as DLC1LD_ForgeSteamValveScript).GoToState("Animating")
(ValveRight as DLC1LD_ForgeSteamValveScript).GoToState("Animating")
SetStage(59)

;Kill any and all surviving spiders or spheres.
(BattleSpider01 as Actor).Kill()
ObjectReference Manager = SpiderManager
While(Manager != None)
     if (Manager.GetLinkedRef(LinkCustom01) != None)
          (Manager.GetLinkedRef(LinkCustom01) as Actor).Kill()
     EndIf
     Manager = Manager.GetLinkedRef()
     Utility.Wait(0.1)
EndWhile
Manager = SpiderManager2
While(Manager != None)
     if (Manager.GetLinkedRef(LinkCustom01) != None)
          (Manager.GetLinkedRef(LinkCustom01) as Actor).Kill()
     EndIf
     Manager = Manager.GetLinkedRef()
     Utility.Wait(0.1)
EndWhile
Manager = SphereManager
While(Manager != None)
     if (Manager.GetLinkedRef(LinkCustom01) != None)
          (Manager.GetLinkedRef(LinkCustom01) as Actor).Kill()
     EndIf
     Manager = Manager.GetLinkedRef()
     Utility.Wait(0.1)
EndWhile
;Manager = SphereManager2
;While(Manager != None)
;     if (Manager.GetLinkedRef(LinkCustom01) != None)
;          (Manager.GetLinkedRef(LinkCustom01) as Actor).Kill()
;     EndIf
;     Manager = Manager.GetLinkedRef()
;     Utility.Wait(0.1)
;EndWhile

MUSReward.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Katria fadeout ends.
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeOutNoWait()

;Complete the main quest.
DLC1LD.SetStage(255)

;Restore the Stairs and Stair NM.
DLC1LD_AetheriumForgeStairs.PlayAnimation("raise")
ForgeStairTopCollision.Disable()
DLC1LD_GroundCutNM.Enable()
DLC1LD_StairCutNM.Disable()
Utility.Wait(5)
ForgeStairCollision.Enable()

;Shut down this quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Katria in Bthalft, Scene 01
;Also doubles as dialogue flag: Player enters the Aetherium Forge interior.
if (DLC1LD.GetStageDone(130))
     DLC1LD_Katria_Bthalft01.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Forge: Entryway Scene
if (DLC1LD.GetStageDone(130))
     ;If the player is with Katria, they have to shut down the steam first.
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(MoveTarget5)
     DLC1LD_Katria_Forge01.Start()
Else
     ;Otherwise, flag the battle to start when the player reaches the main floor.
     SetStage(49)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
;Dialogue flag: Katria in Final Forcegreet.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;All the steam is off, so complete the objective.
if (DLC1LD.GetStageDone(130))
     DLC1LD.SetStage(206)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
;Katria in Bthalft, Scene 02
if (DLC1LD.GetStageDone(130) && CurrentFollower.GetActorRef() == None)
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(MoveTarget1)
     DLC1LD_Katria_Bthalft02.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;Player shuts down the second steam valve.
;Complete the objective.
DLC1LD.SetStage(196)

;Drop the stairs.
SetStage(48)

;Rumble, shake, major dust drop.
AmbRumbleShake.Play(Game.GetPlayer())
Game.GetPlayer().RampRumble(1, 2, 1600)
Game.ShakeCamera(None, 0.75, 2)
MUSDread.Add()
ForgeDustFX[1].OnActivate(Game.GetPlayer())
ForgeDustFX[5].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[10].OnActivate(Game.GetPlayer())
ForgeDustFX[15].OnActivate(Game.GetPlayer())
ForgeDustFX[13].OnActivate(Game.GetPlayer())
Utility.Wait(0.2)
ForgeDustFX[2].OnActivate(Game.GetPlayer())
ForgeDustFX[6].OnActivate(Game.GetPlayer())
ForgeDustFX[9].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[14].OnActivate(Game.GetPlayer())
Utility.Wait(0.3)
ForgeDustFX[0].OnActivate(Game.GetPlayer())
ForgeDustFX[3].OnActivate(Game.GetPlayer())
ForgeDustFX[4].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[11].OnActivate(Game.GetPlayer())
ForgeDustFX[12].OnActivate(Game.GetPlayer())
Utility.Wait(1)

;Trigger Katria's scene once things die down.
DLC1LD_Katria_Forge02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;Katria in Bthalft, Scene 03
if (DLC1LD.GetStageDone(130))
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(MoveTarget2)
     DLC1LD_Katria_Bthalft03.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Begin the spider phase of the battle.

;Display the battle objective.
if (DLC1LD.GetStageDone(130))
     DLC1LD.SetStage(200)
EndIf

;Activate four spiders initially.
;One manually, the other three from the Battle Manager, which keeps three active thereafter.
BattleSpider01.Enable(False)
BattleSpider01.Activate(SpiderManager)
ObjectReference currentLink = (SpiderManager as dunProgressiveCombatScript).BattleManager
Debug.Trace("ENABLING: " + currentLink + ", " + currentLink.GetLinkedRef(LinkCustom01))
While (currentLink != None)
     currentLink.GetLinkedRef(LinkCustom01).Enable(False)
     currentLink = currentLink.GetLinkedRef()
     Debug.Trace("ENABLING: " + currentLink + ", " + currentLink.GetLinkedRef(LinkCustom01))
EndWhile
(SpiderManager as dunProgressiveCombatScript).Activate(SpiderManager)

;Trigger the first Katria scene if applicable.
if (DLC1LD.GetStageDone(130))
     Utility.Wait(1)
     if (Game.GetPlayer().GetDistance(Alias_Katria.GetActorRef()) > 1200)
          (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeOut()
          Alias_Katria.GetActorRef().MoveTo(Game.GetPlayer())
          (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
     EndIf
     DLC1LD_Katria_Forge03.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;Katria in Bthalft, Scene 04
if (DLC1LD.GetStageDone(130) && !GetStageDone(36))
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(MoveTarget3)
     DLC1LD_Katria_Bthalft04.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;Display the 'Shut Down the Steam' objective.
 if (DLC1LD.GetStageDone(130) && !GetStageDone(59) && !GetStageDone(75))
     DLC1LD.SetStage(205)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
;Stairs drop. Cut the Stair NM.
DLC1LD_AetheriumForgeStairs.PlayAnimation("lower")
ForgeStairCollision.Disable()
ForgeStairTopCollision.Enable()
DLC1LD_GroundCutNM.Disable()
DLC1LD_StairCutNM.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player stands clear. Progress Bthalft Rising scene.
DLC1LD.SetStage(185)

;Disable trigger.
BthalftStandClearTrigger.Disable()

;If Katria isn't here, we just progress automatically.
if (!DLC1LD.GetStageDone(130))
     SetStage(27)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Katria in Bthalft, Scene 05
if (DLC1LD.GetStageDone(130))
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(MoveTarget4)
     DLC1LD_Katria_Bthalft05.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;Forgemaster has emerged from the lava.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Katria has performed her initial forcegreet. Player is directed to use the shards.
DLC1LD.SetStage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Bthalft Rising scene complete. Player is directed to enter Aetherium Forge.
DLC1LD.SetStage(190)

;Katria begins following the player (restricted to Bthalft)
if (DLC1LD.GetStageDone(130))
     Alias_Katria.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
;Flag: Player is not with Katria, so the battle should start when they reach the main floor.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;Reactivate the steam.
(DLC1LD_FXSteamCenter as DLC1LD_BthalftSteamManagerScript).EnableSteam()
(DLC1LD_FXSteamLeft as DLC1LD_BthalftSteamManagerScript).EnableSteam()
(DLC1LD_FXSteamRight as DLC1LD_BthalftSteamManagerScript).EnableSteam()

;Katria shouts a warning.
Utility.Wait(2)
SetStage(58)
if (DLC1LD.GetStageDone(130))
     if (Alias_Katria.GetActorRef().IsDisabled())
          (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
     EndIf
     If (!GetStageDone(59))
          DLC1LD_Katria_Forge05.Start()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Begin the battle.
;Drop the stairs if we haven't done so already.
SetStage(48)

;Another rumble.
AmbRumbleShakeGreybeards.Play(Game.GetPlayer())

;Play an effect on the pipe caps.
PipeCapFX.Play(SpiderPipeCaps[0], 2)
PipeCapFX.Play(SpiderPipeCaps[1], 2)
PipeCapFX.Play(SpiderPipeCaps[2], 2)
PipeCapFX.Play(SpiderPipeCaps[3], 2)
PipeCapFX.Play(SpiderPipeCaps[4], 2)
PipeCapFX.Play(SpiderPipeCaps[5], 2)
PipeCapFX.Play(SpiderPipeCaps[6], 2)
PipeCapFX.Play(SpiderPipeCaps[7], 2)
PipeCapFX.Play(SpiderPipeCaps[8], 2)
PipeCapFX.Play(SpiderPipeCaps[9], 2)

;Wait 1s, then continue to Stage 51 to start the battle.
SetStage(51)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;Flag: Player has struck both resonators in Bthalft.
MUSReward.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
;Trigger Katria final scene.
if (DLC1LD.GetStageDone(130))
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = True
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaFinale()
     DLC1LD_Katria_Finale.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Callback from DLC1LD. Begin Bthalft Rising sequence.
;Trigger steady rumble.
(RumbleManager as DLC1LD_TowerRumbleShakeManager).Activate(Game.GetPlayer())

;Katria yells for the player to get back.
if (DLC1LD.GetStageDone(130))
     DLC1LD_BthalftPreRising.Stop()
     DLC1LD_BthalftRisingScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
;Player shuts down the first steam valve. Rumble, minor shake, minor dust drop.
AmbRumbleShakeGreybeards.Play(Game.GetPlayer())
Game.GetPlayer().RampRumble(0.1, 1, 1600)
Game.ShakeCamera(None, 0.1, 1)
MUSDread.Add()
ForgeDustFX[0].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[4].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[8].OnActivate(Game.GetPlayer())
Utility.Wait(0.1)
ForgeDustFX[12].OnActivate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
;Dialogue flag: Player asks 'Forge with What?'
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Player places the last of the shards.

;Trigger light rumble.
(RumbleManager as DLC1LD_TowerRumbleShakeManager).Activate(Game.GetPlayer())

if (DLC1LD.GetStageDone(130))
     DLC1LD_BthalftPreRising.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property KatriaBthalftExteriorMarker  Auto  

Quest Property DLC1LD  Auto  

ObjectReference Property BthalftStandClearTrigger  Auto  

Scene property DLC1LD_BthalftForgemasterApproach auto
Scene property DLC1LD_BthalftForgemasterBattle2 auto
Scene property DLC1LD_BthalftForgemasterBattle3 auto
Scene property DLC1LD_BthalftForgemasterBattleEnd auto
Scene property DLC1LD_BthalftForgemasterBattleIntro1 auto
Scene property DLC1LD_BthalftMainCavern auto
Scene property DLC1LD_BthalftRisingScene auto

ObjectReference Property MoveTarget1  Auto  

ObjectReference Property MoveTarget2 Auto  

ObjectReference Property MoveTarget3  Auto  

Sound Property AMBRumbleShake  Auto  

ObjectReference Property DLC1LD_BthalftElevatorMarker  Auto  

ObjectReference Property DLC1LD_BthalftExteriorNavcutCollisionMarker  Auto  

ObjectReference Property BattleSpider01  Auto  

ObjectReference Property SpiderManager  Auto  

ObjectReference Property SphereManager  Auto  

ObjectReference Property SphereGateTrigger01  Auto  

ObjectReference Property SphereGateTrigger02  Auto  

Keyword Property LinkCustom01  Auto  

Scene Property DLC1LD_BthalftPreRising  Auto  

ObjectReference Property SphereGate1  Auto  

ObjectReference Property SphereGate2  Auto  

ObjectReference Property DLC1LD_FXSteamLeft  Auto  

ObjectReference Property DLC1LD_FXSteamRight  Auto  

ObjectReference Property DLC1LD_FXSteamCenter  Auto  

Scene Property DLC1LD_BthalftForgemasterBattle4  Auto  

ObjectReference Property DLC1LD_StairCutNM  Auto  

ObjectReference Property DLC1LD_GroundCutNM  Auto  

ObjectReference Property DLC1LD_AetheriumForgeStairs  Auto  

ObjectReference Property SpiderManager2  Auto  

ObjectReference Property SphereManager2  Auto  

Scene Property DLC1LD_BthalftForgemasterBattle0  Auto  

Scene Property DLC1LD_Katria_Bthalft01  Auto  

ObjectReference Property ForgeStairCollision  Auto  

Scene Property DLC1LD_Katria_Bthalft02  Auto  

Scene Property DLC1LD_Katria_Bthalft03  Auto  

Scene Property DLC1LD_Katria_Bthalft04  Auto  

ObjectReference Property BthalftPuzzleDoor  Auto  

ObjectReference Property MoveTarget4  Auto  

ObjectReference Property MoveTarget5  Auto  

Scene Property DLC1LD_Katria_Bthalft05  Auto  

Scene Property DLC1LD_Katria_Forge01  Auto  

ObjectReference[] Property ForgeDustFX  Auto  

Sound Property AMBRumbleShakeGreybeards  Auto  

Scene Property DLC1LD_Katria_Forge02  Auto  

ObjectReference[] Property SpiderPipeCaps  Auto  

EffectShader Property PipeCapFX  Auto  

Scene Property DLC1LD_Katria_Forge03  Auto  

Scene Property DLC1LD_Katria_Forge04  Auto  

Scene Property DLC1LD_Katria_Forge05  Auto  

Scene Property DLC1LD_Katria_Forge06  Auto

Scene Property DLC1LD_Katria_Forge07  Auto

ObjectReference Property DLC1LD_FXSteamForge  Auto  

ObjectReference Property ForgeStairTopCollision  Auto  

ObjectReference Property RumbleManager  Auto  

ReferenceAlias Property CurrentFollower  Auto  

MusicType Property MUSDread  Auto  

MusicType Property MUSReward  Auto  

ObjectReference Property AetheriumForge  Auto  

ObjectReference Property AetheriumForgeFurniture  Auto  

Scene Property DLC1LD_Katria_Finale  Auto  

Scene Property DLC1LD_Katria_Forge06b  Auto  

ObjectReference Property ValveLeft  Auto  

ObjectReference Property ValveRight  Auto  
