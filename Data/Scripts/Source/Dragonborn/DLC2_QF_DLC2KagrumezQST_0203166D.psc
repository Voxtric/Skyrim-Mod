;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname DLC2_QF_DLC2KagrumezQST_0203166D Extends Quest Hidden

;BEGIN ALIAS PROPERTY spiderSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_spiderSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bossSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bossSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY sphereSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_sphereSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KagrumezGem03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KagrumezGem03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SphereFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SphereFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY sceneBanditSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_sceneBanditSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KagrumezGem05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KagrumezGem05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY sceneBandit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_sceneBandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KagrumezGem01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KagrumezGem01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KagrumezGem04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KagrumezGem04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KagrumezGem02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KagrumezGem02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Spider = alias_spiderFriend.getreference() as Actor

(DialogueFollower as DialogueFollowerScript).SetAnimal(alias_spiderFriend.getactorreference())

Spider.evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;3 Gems collected
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_banditBoss.GetReference().AddItem(Alias_KagrumezGem01.GetReference())
Alias_banditBoss.GetReference().AddItem(Alias_KagrumezGem02.GetReference())
self.setstage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;5 Gems collected
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
setObjectiveCompleted(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;2 Gems collected
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Actor Sphere = alias_sphereFriend.getreference() as Actor

(DialogueFollower as DialogueFollowerScript).SetAnimal(alias_sphereFriend.getactorreference())

Sphere.evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;1 Gem collected
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;4 Gems collected
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DialogueFollowerScript Property DialogueFollower Auto
