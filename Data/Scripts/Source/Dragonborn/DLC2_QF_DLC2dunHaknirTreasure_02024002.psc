;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname DLC2_QF_DLC2dunHaknirTreasure_02024002 Extends Quest Hidden

;BEGIN ALIAS PROPERTY POIBandit02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_POIBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Haknir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Haknir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chest04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY POIBandit01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_POIBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShoalBanditOther
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShoalBanditOther Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaknirsShoalLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HaknirsShoalLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GyldenhulBarrowLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GyldenhulBarrowLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureMap
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureMap Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY POIBandit02Book
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_POIBandit02Book Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShoalBanditScene
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShoalBanditScene Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chest01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShoalBanditBossBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShoalBanditBossBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chest02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaknirArmor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaknirArmor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShoalBanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShoalBanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaknirHelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaknirHelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaknirsSword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaknirsSword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaknirGauntlets
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaknirGauntlets Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HaknirBoots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HaknirBoots Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chest03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chest03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GyldenhulBarrowKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GyldenhulBarrowKey Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Player obtains a rumor about this activity in Raven Rock.
;This is here (not on Misc) because it also serves as a flag for the rumor.
if (!GetStageDone(30))
     DLC2dunHaknirTreasureQSTMisc.SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
if (!GetStageDone(100))
     TreasureRoomPortcullisCollision.Enable()
     TreasureRoomPortcullis.Activate(TreasureRoomPortcullis)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Updated journal entry once the player has both opened the chest and found the map.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC2Book4RareDeathbrand)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player opens [Chest01].
chestCount = chestCount + 1
if (chestCount == 3)
     ;If this is the third chest opened, set stage 45.
     SetStage(45)
ElseIf (chestCount == 4)
     ;If this is the fourth chest opened, set stage 70.
     ;SetStage(70)
EndIf

;Show initial objective, or update the journal entry.
if (GetStageDone(30))
     SetStage(31)
Else
     SetStage(29)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player opens [Chest03].
chestCount = chestCount + 1
if (chestCount == 3)
     ;If this is the third chest opened, set stage 45.
     SetStage(45)
ElseIf (chestCount == 4)
     ;If this is the fourth chest opened, set stage 70.
     ;SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player opens [Chest04].
chestCount = chestCount + 1
if (chestCount == 3)
     ;If this is the third chest opened, set stage 45.
     SetStage(45)
ElseIf (chestCount == 4)
     ;If this is the fourth chest opened, set stage 70.
     ;SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Rumble and Shake
Game.ShakeController(0.75, 0.75, 3)
Game.ShakeCamera(None, 0.5, 3)
AmbRumbleShake.Play(Game.GetPlayer())

;Haknir dies.
DLC2dunHaknirRotatingDoorCollision.Disable()
DLC2dunHaknirRotatingDoorCollision2.Disable()
TreasureRoomPortcullisCollision.Disable()
HaknirRotatingDoor.Activate(HaknirRotatingDoor)
if (GetStageDone(80))
     TreasureRoomPortcullis.Activate(TreasureRoomPortcullis)
EndIf
CompleteAllObjectives()
CompleteQuest()
(AchievementsQuest as AchievementsScript).IncSideQuests()

;Now, just shut down the quest.
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
SetObjectiveCompleted(70)

;Close the exit.
DLC2dunHaknirRotatingDoorCollision.Enable()
DLC2dunHaknirRotatingDoorCollision2.Enable()
HaknirRotatingDoor.Activate(HaknirRotatingDoor)

;Rumble and Shake
Game.ShakeController(0.5, 0.5, 3)
Game.ShakeCamera(None, 0.5, 3)
AmbRumbleShakeGreybeards.Play(Game.GetPlayer())

;Play Dread SFX
Utility.Wait(1)
MUSDread.Add()

;Start battle.
Utility.Wait(1)
(Alias_Haknir.GetActorRef() as DLC2dunHaknirBossBattleScript).StartBattlePhase(0)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Set when the player takes the armor from [Chest03]
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Set when the player takes the armor from [Chest01]
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player picks up the map from the corpse of the bandit boss at Haknir's Shoal.

;Complete misc objective, if applicable.
DLC2dunHaknirTreasureQSTMisc.SetStage(20)

;Complete interim objective, if necessary.
SetObjectiveCompleted(29)

;Add new objective to follow the map.
SetObjectiveDisplayed(30)


;Enable Chest 02
DLC2dunHaknirChest02Enable.Enable()
DLC2dunHaknirChest02Disable.Disable()

;Enable Chest 03
DLC2dunHaknirChest03Enable.Enable()
DLC2dunHaknirChest03Disable.Disable()

;Enable Chest 04
DLC2dunHaknirChest04Enable.Enable()
DLC2dunHaknirChest04Disable.Disable()

;Start POI02 Scene
Utility.Wait(1)
DLC2dunHaknirPOI2Scene.Start()

;Update to Journal Entry 31 if the player has already opened the chest.
if (GetStageDone(40))
     SetStage(31)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Set when the player takes the armor from [Chest04]
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(70)
DLC2GyldenhulBarrowMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Set when the player takes the armor from [Chest02]
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player opens [Chest02].
chestCount = chestCount + 1
if (chestCount == 3)
     ;If this is the third chest opened, set stage 45.
     SetStage(45)
ElseIf (chestCount == 4)
     ;If this is the fourth chest opened, set stage 70.
     ;SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;After the player opens three chests, place the Gyldenhul Barrow Key in the fourth.
if (!GetStageDone(40))
     Alias_Chest01.GetReference().AddItem(Alias_GyldenhulBarrowKey.GetReference())
ElseIf (!GetStageDone(41))
     Alias_Chest02.GetReference().AddItem(Alias_GyldenhulBarrowKey.GetReference())
ElseIf (!GetStageDone(42))
     Alias_Chest03.GetReference().AddItem(Alias_GyldenhulBarrowKey.GetReference())
Else
     Alias_Chest04.GetReference().AddItem(Alias_GyldenhulBarrowKey.GetReference())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;The quest begins when the player hits the minimum level for Stahlrim Armor. (36)

;Register for an update immediately. The update checks to see if the player is near Haknir's Shoal.
;If so, it re-registers for an update; if not, it sets Stage 20, which is what really kicks off the quest.

;Debug.Trace("Haknir Treasure QST has started.")
RegisterForSingleUpdate(0.1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Stage 20 is set by the OnUpdate event when the initial conditions (Level 36, not near Haknir's Shoal)
;are satisfied.
;Debug.Trace("Stage 20 set.")

;At Haknir's Shoal, enable the first treasure chest.
DLC2HaknirsShoalTreasureEnableMarker.Enable()
DLC2HaknirsShoalTreasureDisableMarker.Disable()

;Move the map and book into the bandit boss' inventory.
;We no longer create them there because we have to wait for this stage to be set first.
Alias_ShoalBanditBoss.GetActorRef().AddItem(Alias_TreasureMap.GetReference())
Alias_ShoalBanditBoss.GetActorRef().AddItem(Alias_ShoalBanditBossBook.GetReference())

;At Haknir's Shoal, resurrect the bandits (if necessary) and start their scene.
Alias_ShoalBanditBoss.GetActorRef().Resurrect()
Alias_ShoalBanditBoss.GetActorRef().Reset()
Alias_ShoalBanditScene.GetActorRef().Resurrect()
Alias_ShoalBanditScene.GetActorRef().Reset()
Alias_ShoalBanditOther.GetActorRef().Resurrect()
Alias_ShoalBanditOther.GetActorRef().Reset()
DLC2dunHaknirShoalScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Failsafe. If the player opens [Chest01] on Haknir's Shoal without having obtained the map first,
;this stage is set to provide an initial objective and journal entry.

;Complete misc objective, if applicable.
DLC2dunHaknirTreasureQSTMisc.SetStage(20)

;Display the failsafe objective.
SetObjectiveDisplayed(29)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Event OnUpdate()
	Location currentLoc = Game.GetPlayer().GetCurrentLocation()
	if (currentLoc == DLC2HaknirsShoalLocation || Alias_ShoalBanditBoss.GetActorRef().Is3DLoaded())
; 		Debug.Trace("Re-registering.")
		RegisterForSingleUpdate(1)
	Else
; 		Debug.Trace("Starting Treasure Map Quest.")
		SetStage(20)
     EndIf
EndEvent


Location property DLC2HaknirsShoalLocation Auto
Location property DLC2GyldenhulBarrowLocation Auto

ObjectReference property DLC2HaknirsShoalTreasureDisableMarker Auto
ObjectReference property DLC2HaknirsShoalTreasureEnableMarker Auto

Scene Property DLC2dunHaknirShoalScene  Auto  

Key Property DLC2dunGyldenhulBarrowKey  Auto  

ObjectReference property DLC2dunHaknirChest02Enable Auto
ObjectReference property DLC2dunHaknirChest03Enable Auto
ObjectReference property DLC2dunHaknirChest04Enable Auto

ObjectReference property DLC2dunHaknirChest02Disable Auto
ObjectReference property DLC2dunHaknirChest03Disable Auto
ObjectReference property DLC2dunHaknirChest04Disable Auto

Int Property chestCount  Auto  

Quest Property DLC2dunHaknirTreasureQSTMisc  Auto  

Scene Property DLC2dunHaknirPOI2Scene  Auto  

Quest Property AchievementsQuest  Auto  

ObjectReference Property HaknirRotatingDoor  Auto  

ObjectReference Property DLC2dunHaknirRotatingDoorCollision  Auto  

Sound Property AmbRumbleShake  Auto  

Sound Property AMBRumbleShakeGreybeards  Auto  

ObjectReference Property TreasureRoomPortcullis  Auto  

ObjectReference Property TreasureRoomPortcullisCollision  Auto  

Book Property DLC2Book4RareDeathbrand  Auto  

ObjectReference Property DLC2GyldenhulBarrowMapMarker  Auto  

MusicType Property MUSDread  Auto  

ObjectReference Property DLC2dunHaknirRotatingDoorCollision2  Auto  
