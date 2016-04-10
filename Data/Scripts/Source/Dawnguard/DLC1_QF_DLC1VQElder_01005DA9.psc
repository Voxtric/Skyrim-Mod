;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname DLC1_QF_DLC1VQElder_01005DA9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Serana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Serana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderScrollThree
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderScrollThree Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderScrollTwoMaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderScrollTwoMaster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderDexionAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderDexionAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderRNPCAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderRNPCAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderScrollTwo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderScrollTwo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderUragAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderUragAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1HoldingCellSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1HoldingCellSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderScrollTwoCreated
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderScrollTwoCreated Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderScrollOne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderScrollOne Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Moth Priest Points at the Ancestors Glade - Kick off VQ06
pDLC1AncestorGladeMapMarker.AddToMap()
SetObjectiveCompleted(30,1)
Game.GetPlayer().AddItem(Alias_DLC1VQElderScrollOne.GetRef())
CompleteAllObjectives()
Stop()
pDLC1VQ06.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
pElderScrollDragonExternalQA.ForceRefTo(Alias_DLC1VQElderScrollTwoMaster.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Elder Scroll from Main Quest obtained
SetObjectiveCompleted(10,1)
pDLC1ElderScrollCount.SetValue(pDLC1ElderScrollCount.GetValue() +1)
if pDLC1ElderScrollCount.GetValue() >= 2
SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Moth Priest Points at the Ancestors Glade - Kick off VQ06
pDLC1AncestorGladeMapMarker.AddToMap()
SetObjectiveCompleted(30,1)
Game.GetPlayer().AddItem(Alias_DLC1VQElderScrollOne.GetRef())
CompleteAllObjectives()
Stop()
pDLC1VQ06.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Maintenance if Urag sells the Scroll to Player
if pDLC1VQElderScrollCoin.GetValue() == 2
Game.GetPlayer().RemoveItem(pGold,2000)
pCollegeElderScrollRef.Disable()
Game.GetPlayer().AddItem(Alias_DLC1VQElderScrollTwoMaster.GetRef(),1)
SetStage(20)
elseif pDLC1VQElderScrollCoin.GetValue() == 3
pCollegeElderScrollRef.Disable()
Game.GetPlayer().RemoveItem(pGold,3000)
Game.GetPlayer().AddItem(Alias_DLC1VQElderScrollTwoMaster.GetRef(),1)
SetStage(20)
elseif pDLC1VQElderScrollCoin.GetValue() == 4
pCollegeElderScrollRef.Disable()
Game.GetPlayer().RemoveItem(pGold,4000)
Game.GetPlayer().AddItem(Alias_DLC1VQElderScrollTwoMaster.GetRef(),1)
SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Elder Scroll from Soul Cairn obtained
SetObjectiveCompleted(20,1)
pDLC1ElderScrollCount.SetValue(pDLC1ElderScrollCount.GetValue() +1)
if pDLC1ElderScrollCount.GetValue() >= 2
SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Serana talks at the player
SeranaScene.Start()

;Both Elder Scrolls now in hand, point quest back to Dexion
;Swap Dexion's Outfit (off camera)
Alias_DLC1VQElderDexionAlias.GetActorRef().SetOutfit(pDLC1MothPriestBlindfoldedOutfit,false)
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
If IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Both Elder Scrolls now in hand, point quest back to Dexion
;Swap Dexion's Outfit (off camera)
Alias_DLC1VQElderDexionAlias.GetActorRef().SetOutfit(pDLC1MothPriestBlindfoldedOutfit,false)
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
If IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Get both scrolls for the moth priest to read - assigned
;Have RNPC find Player and FG by init on DLC1VQ04
;Do the check for the state of the DA04 Elder Scroll
SetObjectiveDisplayed(10,1)
SetObjectiveDisplayed(20,1)
pElderScrollSunQI.ForceRefTo(Alias_DLC1VQElderScrollOne.GetRef())
if Game.GetPlayer().GetItemCount(Alias_DLC1VQElderScrollTwoMaster.GetRef()) == 1
pDLC1ElderScrollCount.SetValue(pDLC1ElderScrollCount.GetValue() +1)
SetObjectiveCompleted(10,1)
endif

;This checks what part of handler to fire if need be

if pDA04.GetStage() < 10
	pDLC1VQElderHandler.SetStage(20)
endif

if (pDialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).ScrollDonated != 0
	pDLC1VQElderHandler.SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property pDLC1VQ04  Auto
Quest Property pDLC1VQ06  Auto  
ReferenceAlias Property pRNPC  Auto  
ObjectReference Property pRNPCTempStartXMarker  Auto  
ObjectReference Property pDLC1PlayerStartXMarker  Auto  

GlobalVariable Property pDLC1VQElderScrollCoin  Auto  

MiscObject Property pGold  Auto  

Book Property pDLC1ElderScrollDragon  Auto  

GlobalVariable Property pDLC1ElderScrollCount  Auto  

Outfit Property pDLC1MothPriestBlindfoldedOutfit  Auto  

Quest Property pDLC1VQElderHandler  Auto  

Quest Property pDA04  Auto  

Quest Property pDialogueWinterholdCollege  Auto  

Book Property pDLC1ElderScrollSun  Auto  

ReferenceAlias Property pElderScrollSunQI  Auto  

ObjectReference Property pCollegeElderScrollRef  Auto  

Scene Property SeranaScene  Auto  

ObjectReference Property pDLC1AncestorGladeMapMarker  Auto  

ReferenceAlias Property pElderScrollDragonExternalQA  Auto  
