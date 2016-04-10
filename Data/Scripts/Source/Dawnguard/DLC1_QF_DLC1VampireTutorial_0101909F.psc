;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname DLC1_QF_DLC1VampireTutorial_0101909F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Harkon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Harkon Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
DLC1VampireTutorialScene1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Tutorial scene over, Harkon now force-greets

Alias_Harkon.GetActorRef().Stopcombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Unlock the door to the shrine room and set its lock level to 0
ShrineRoomDoor.Lock(False)
ShrineRoomDoor.SetLockLevel(0)

;Revert tutorial message
DLC1VampireTutorialRevert.Show()

;Unblock activation on Harkon
Alias_Harkon.GetActorRef().BlockActivation(False)

;Finish the Bloodline quest and issue the base intro quest
DLC1VQ02.SetStage(180)

;Finish the tutorial quest
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Remove Harkon and the player from the DLC1TutorialFaction
Alias_Harkon.GetActorReference().RemoveFromFaction(DLC1TutorialFaction)
Game.GetPlayer().RemoveFromFaction(DLC1TutorialFaction)

;Set Harkon to no longer ignore friendly hits
Alias_Harkon.GetActorReference().IgnoreFriendlyHits(False)

;Shutdown stage, set when the MiscObjective quest starts
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Stage 10, startup stage

;Close and lock the door to the shrine room where the scene takes place
ShrineRoomDoor.Lock()
ShrineRoomDoor.SetOpen(False)
DLC1VampCastleInteriorPortcullis.SetOpen()

;Reset "Inventory" as a button press for help message functionality
Message.ResetHelpMessage("Tween Menu")

;Reset "Sneak" as a button press for help message functionality
Message.ResetHelpMessage("Sneak")

;Add Harkon and the player to the DLC1TutorialFaction
Alias_Harkon.GetActorReference().AddToFaction(DLC1TutorialFaction)
Game.GetPlayer().AddToFaction(DLC1TutorialFaction)

;Set Harkon to ignore friendly hits
Alias_Harkon.GetActorReference().IgnoreFriendlyHits()

;Block activation on Harkon
Alias_Harkon.GetActorReference().BlockActivation()

;Call EVP on Harkon
Alias_Harkon.GetActorRef().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Harkon forcegreets
;Call EVP on Harkon
Alias_Harkon.GetActorRef().evaluatepackage()

;Allow weapons again - leave everything else the way it was (which is presumably enabled)
Game.EnablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = false, abLooking = false, abSneaking = true, abMenu = false, abActivate = false, abJournalTabs = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player has been told to turn into Vampire Lord form
;DLC!VampireTutorialTransform.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA08  Auto  

Scene Property DLC1VampireTutorialScene1  Auto  

Message Property DLC1VampireTutorialTransform  Auto  

Message Property DLC1VampireTutorialLand  Auto  

ObjectReference Property ShrineRoomDoor  Auto  

ObjectReference Property DLC1VampCastleInteriorPortcullis  Auto  

Quest Property DLC1VQ02  Auto  

Faction Property DLC1TutorialFaction  Auto  

Message Property DLC1VampireTutorialRevert  Auto  
