;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 37
Scriptname DLC1_QF_VQ04Hunter_0100284F Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQ04HoldingSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04HoldingSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04SealTwo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04SealTwo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04BookAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04BookAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04VoidSaltIngredAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04VoidSaltIngredAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04BoneMealBowlAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04BoneMealBowlAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04RNPC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04RNPC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04SoulGemBowlAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04SoulGemBowlAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04BoneMealIngredAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04BoneMealIngredAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04PortalActivatorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04PortalActivatorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04LabAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04LabAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04PortalDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04PortalDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04SealThree
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04SealThree Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04VoidSaltBowlAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04VoidSaltBowlAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04MoondialMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04MoondialMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04MoondialAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04MoondialAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04SealOne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04SealOne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04BowlActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04BowlActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ04SoulGemShardsAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ04SoulGemShardsAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest completed (Player has entered Soul Cairn portal) - This is triggered inside the Soul Cairn
CompleteAllObjectives()
DLC1VQ04RNPC.Stop()
MM.TurnOffComeWithMe = False
Stop()
pDLC1VQ05.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Vampire Turn Handler Stage
pDLC1VQ04QS.SeranaBite()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;RNPC does the blood in the portal thing - move her into position and then do it!
MM.IsDismissed=false
MM.FollowerCount.SetValue(1) ; a bit of fakery to cover until she's really locked in
MM.TurnOffComeWithMe = True
SetObjectiveCompleted(70,1)
pRNPC.GetActorRef().EvaluatePackage()
pVCDungeon02ToSoulCairn.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Fast Start - Hunters Questline
;Don't forget to StartQuest DLC1Init
pRNPC.GetActorRef().MoveTo(pRNPCTempStartXMarker)
pRNPC.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(pDLC1PlayerStartXMarker)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Soul Trap Handler Stage
pDLC1VQ04QS.SoulTrapped()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Portal is now open - RNPC reaction is based on whether Player is a vampire or not when trigger struck
pBSLever.Activate(pBSLever)
pDLC1VQ04WatchPortalScene.Start()
if Game.GetPlayer().HasKeyword(pVampire) == 0 && pDLC1VQ04SafeToEnter.GetValue() == 0
pDLC1VQ04PortalAreaEffectTriggerRef.Enable()
pDLC1VQ04VampireToggle.Enable()
MM.DisengageFollowBehavior()
endif
pDLC1VQ04PortalOpenLight01.Enable()
pDCL1VQ04PortalClosedLight01.Disable()
SetObjectiveDisplayed(80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Serana is awaiting the Player's decision to become a vampire, or become partially soul trapped
RegisterForUpdate(10)
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(100,1)
SetObjectiveDisplayed(110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Assignment given to head for catacombs
Alias_DLC1VQ04RNPC.GetActorRef().SetPlayerTeammate(true)
MM.EngageFollowBehavior()
MM.IsWillingToWait = false
MM.SetHomeMarker(-1, SeranaWaitPoint)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player should examine the moondial in the castle courtyard
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
MM.DisengageFollowBehavior()
Alias_DLC1VQ04RNPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Player has actuated the moondial statue puzzle
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)

;Safeguard for if the player places the crests very quickly
if pDLC1VQ04CourtyardScene.IsPlaying()
	pDLC1VQ04CourtyardScene.Stop()
endif

pDLC1VQ04StatueDoneScene.Start()
Alias_DLC1VQ04RNPC.GetActorRef().SetPlayerTeammate(true)
MM.EngageFollowBehavior()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Assignment given to head for catacombs
Alias_DLC1VQ04RNPC.GetActorRef().SetPlayerTeammate(true)
MM.EngageFollowBehavior()
MM.IsWillingToWait = false
MM.SetHomeMarker(-1, SeranaWaitPoint)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Player has added all the ingredients to the bowl, tell RNPC to bleed on it
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
if Game.GetPlayer().HasKeyword(pVampire) == 1
pDLC1VQ04QS.VampireEarly()
endif

MM.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;After choice, Player decided to become a vampire externally of Serana
pDLC1VQ04QS.TurnedByOther()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Serana go for Soul Trap!
pDLC1VQ04RNPCSoulTrapScene.Start()
UnregisterforUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Debug Fast Start - Vampire Quest Line
;Don't forget to StartQuest DLC1Init
pRNPC.GetActorRef().MoveTo(pDLC1VQ04VampireRNPCStart)
pRNPC.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(pDLC1VQ04VampirePlayerStart)
pDLC1PlayerIsOnVampireLine.SetValue(1)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Optional Stage - Triggers if the Player is not a Vampire and hits the triggerbox
;RNPC Forcegreets Player to resolve ending
SetObjectiveDisplayed(80,0)
SetObjectiveDisplayed(90,1)
pRNPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Player tripped the courtyard trigger, start RNPC Courtyard Scene
pDLC1VQ04CourtyardScene.Start()
Alias_DLC1VQ04RNPC.GetActorRef().SetPlayerTeammate(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Player located the book
if IsObjectiveDisplayed(40) == 1
SetObjectiveCompleted(40,1)
endif
if IsObjectiveDisplayed(45) == 1
SetObjectiveCompleted(45,1)
endif
SetObjectiveDisplayed(50,1)
Alias_DLC1VQ04RNPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Search the lab for the ingredients
SetObjectiveCompleted(50,1)

if pDLC1VQ04FoundSoulShards.GetValue() == 0
SetObjectiveDisplayed(52,1)
elseif pDLC1VQ04FoundSoulShards.GetValue() == 1
pDLC1VQ04Ingredient.SetValue(pDLC1VQ04Ingredient.GetValue() +1)
endif

if pDLC1VQ04FoundBoneMeal.GetValue() == 0
SetObjectiveDisplayed(54,1)
elseif pDLC1VQ04FoundBoneMeal.GetValue() == 1
pDLC1VQ04Ingredient.SetValue(pDLC1VQ04Ingredient.GetValue() +1)
endif

if pDLC1VQ04FoundVoidSalt.GetValue() == 0
SetObjectiveDisplayed(56,1)
elseif pDLC1VQ04FoundVoidSalt.GetValue() == 1
pDLC1VQ04Ingredient.SetValue(pDLC1VQ04Ingredient.GetValue() +1)
endif

Alias_DLC1VQ04RNPC.GetActorRef().EvaluatePackage()
Alias_DLC1VQ04BowlActivator.GetRef().Enable(Alias_DLC1VQ04BowlActivator.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player has all ingredients, place them in the bowl
pRNPC.GetActorRef().EvaluatePackage()
if IsObjectiveDisplayed(50) == 1
SetObjectiveCompleted(50,1)
endif
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Scene has terminated in the lab - have Serana forcegreet player
Alias_DLC1VQ04RNPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Prompt Serana to begin mini-scene at the lab
Alias_DLC1VQ04RNPC.GetActorRef().SetPlayerTeammate(false)
MM.DisengageFollowBehavior()
pDLC1VQ04LabScene.Start()
pDLC1VQ04LabArrival.SetValue(1)
CastleController.LockBalconyDoor(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Serana Mini-Scene done, prompt player to find the book
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(45,1)
Alias_DLC1VQ04RNPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;This it init in DLC1VQElder - RPNC start FG
Alias_DLC1VQ04RNPC.GetActorRef().EvaluatePackage()

Game.GetPlayer().AddToFaction(pDLC1VQDoorBlockerFaction)
Alias_DLC1VQ04RNPC.GetActorRef().AddToFaction(pDLC1VQDoorBlockerFaction)

;Enable the courtyard crests
pDLC1VQ04CrestToggle.Enable()

;Make sure balcony door is locked
CastleController.LockBalconyDoor()

DLC1VQ04RNPC.Start()
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDLC1VQ05  Auto  

ReferenceAlias Property pRNPC  Auto  

ObjectReference Property pRNPCTempStartXMarker  Auto  

ObjectReference Property pDLC1PlayerStartXMarker  Auto  

Quest Property pDLC1Init  Auto  

Scene Property pDLC1VQ04LabScene  Auto  

GlobalVariable Property pDLC1VQ04Dead  Auto  

GlobalVariable Property pDLC1VQ04Ingredient  Auto  

ObjectReference Property pDLC1VQ04VampireToggle  Auto  

GlobalVariable Property pDLC1PlayerIsOnVampireLine  Auto  

ObjectReference Property pDLC1VQ04PortalAreaEffectTriggerRef  Auto  

GlobalVariable Property pDLC1VQ04SafeToEnter  Auto  

Scene Property pDLC1VQ04StatueDoneScene  Auto  

ObjectReference Property pDLC1VQ04VampirePlayerStart  Auto  

ObjectReference Property pDLC1VQ04VampireRNPCStart  Auto  

Scene Property pDLC1VQ04CourtyardScene  Auto  

ObjectReference Property pVCDungeon02ToSoulCairn  Auto  

ObjectReference Property pBSLever  Auto  

ObjectReference Property pDCL1VQ04PortalClosedLight01  Auto  

ObjectReference Property pDLC1VQ04PortalOpenLight01  Auto  

Scene Property pDLC1VQ04WatchPortalScene  Auto  

DLC1_NPCMentalModelScript Property MM Auto

Quest Property DLC1VQ04RNPC  Auto  

dlc1vampireturnscript Property pDLC1VampireTurn  Auto  

GlobalVariable Property pDLC1VQ04BecameVamp  Auto  

GlobalVariable Property pDLC1VQ04FoundSoulShards  Auto  

GlobalVariable Property pDLC1VQ04FoundBoneMeal  Auto  

GlobalVariable Property pDLC1VQ04FoundVoidSalt  Auto  

DLC1VQ04QuestScript Property pDLC1VQ04QS  Auto  

Keyword Property pVampire  Auto  

SoulGem Property pSoulGemBlackFilled  Auto  

ObjectReference Property pDLC1VQ04CrestToggle  Auto  

Scene Property pDLC1VQ04RNPCSoulTrapScene  Auto  

GlobalVariable Property pDLC1VQ04SoulTrapped  Auto  

SPELL Property pDLC1VQSoulDamage  Auto  

Quest Property pDLC1VQ05SoulGemHandler  Auto  

ObjectReference Property SeranaWaitPoint  Auto  

GlobalVariable Property pDLC1VQ04LabArrival  Auto

Faction Property pDLC1VQDoorBlockerFaction  Auto  

DLC1VampireCastleControllerScript Property CastleController Auto
