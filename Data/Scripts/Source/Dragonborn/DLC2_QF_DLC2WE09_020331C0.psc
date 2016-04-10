;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname DLC2_QF_DLC2WE09_020331C0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NoteInitial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NoteInitial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;THIS IS INDENTICAL TO STAGE 10 IN DLCWE09 & DLC2CultistAmbush quest
;***ALL CHANGES NEED TO GO BOTH PLACES!!!****

;Cultists should attack
Actor Cultist1 = Alias_Actor1.GetActorReference()
Actor Cultist2 = Alias_Actor2.GetActorReference()
Actor Cultist3 = Alias_Actor3.GetActorReference()

Cultist1.RemoveFromFaction(dunPrisonerFaction)
Cultist1.RemoveFromFaction(WEPlayerFriend)
Cultist1.AddToFaction(WEPlayerEnemy)

Cultist2.RemoveFromFaction(dunPrisonerFaction)
Cultist2.RemoveFromFaction(WEPlayerFriend)
Cultist2.AddToFaction(WEPlayerEnemy)

Cultist3.RemoveFromFaction(dunPrisonerFaction)
Cultist3.RemoveFromFaction(WEPlayerFriend)
Cultist3.AddToFaction(WEPlayerEnemy)

Cultist1.SetActorValue("Aggression", 1)
Cultist2.SetActorValue("Aggression", 1)
Cultist3.SetActorValue("Aggression", 1)

;reminder: this note is created only if the player hasn't set the DLC2 MQ initial quest objective
if Alias_NoteInitial.GetReference()
   Alias_Actor1.GetReference().AddItem(Alias_NoteInitial.GetReference())
   Alias_NoteInitial.GetReference().enable()
endif

DLC2MQ01.Start()
While DLC2MQ01.IsRunning() == False
; 	debug.trace("DLC2CultistAmbush stage 10, waiting for DLC2MQ01.IsRunning()")
	utility.wait(0.2)
EndWhile

DLC2MQ01AliasForObjective.ForceRefTo(Cultist1)
DLC2MQ01.SetStage(5)

DLC2WE09Chance.setValue(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;cultists talked to player
;stop polling to end the quest
kmyquest.UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Actor1.GetReference().DeleteWhenAble()
Alias_Actor2.GetReference().DeleteWhenAble()
Alias_Actor3.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; debug.trace(self + "stage 0")

if DLC2MQ01.GetStage() >= 5
    Alias_Actor1.GetActorReference().AddToFaction(WEPlayerEnemy)
    Alias_Actor2.GetActorReference().AddToFaction(WEPlayerEnemy)
    Alias_Actor3.GetActorReference().AddToFaction(WEPlayerEnemy)

   Alias_Actor1.GetActorReference().SetActorValue("Aggression", 1)
   Alias_Actor2.GetActorReference().SetActorValue("Aggression", 1)
   Alias_Actor3.GetActorReference().SetActorValue("Aggression", 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC2WE09Chance  Auto  

Faction Property WEPlayerFriend  Auto  

Faction Property WEPlayerEnemy  Auto  

Faction Property dunPrisonerFaction  Auto  

Quest Property DLC2MQ01  Auto  

ReferenceAlias Property DLC2MQ01AliasForObjective  Auto  
