;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC2_QF_DLC2CultistAmbush_0203546D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Cultist1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;THIS IS INDENTICAL TO STAGE 10 IN DLCWE09 & DLC2CultistAmbush quest
;***ALL CHANGES NEED TO GO BOTH PLACES!!!****

;Cultists should attack
Actor Cultist1 = Alias_Cultist1.GetActorReference()
Actor Cultist2 = Alias_Cultist2.GetActorReference()

Cultist1.RemoveFromFaction(dunPrisonerFaction)
Cultist1.RemoveFromFaction(WEPlayerFriend)
Cultist1.AddToFaction(WEPlayerEnemy)

Cultist2.RemoveFromFaction(dunPrisonerFaction)
Cultist2.RemoveFromFaction(WEPlayerFriend)
Cultist2.AddToFaction(WEPlayerEnemy)

Cultist1.SetActorValue("Aggression", 1)
Cultist2.SetActorValue("Aggression", 1)

if Alias_Note.GetReference()
   Alias_Cultist1.GetActorReference().AddItem(Alias_Note.GetReference())
   Alias_Note.GetReference().enable()
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;cultists talked to player... used by the player alias script to stop turning off the encounter
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.trace(self + "stage 255, calling Disable() and DeleteWhenAble() on created aliases")
Alias_Cultist1.GetReference().Disable()
Alias_Cultist2.GetReference().Disable()

Alias_Cultist1.GetReference().DeleteWhenAble()
Alias_Cultist2.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property WEPlayerFriend  Auto  

Faction Property dunPrisonerFaction  Auto  

Faction Property WEPlayerEnemy  Auto  

ReferenceAlias Property DLC2MQ01AliasForObjective  Auto  

Quest Property DLC2MQ01  Auto  

GlobalVariable Property DLC2WE09Chance  Auto  
