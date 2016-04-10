;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 32
Scriptname DLC1_QF_DLC01SoulCairnHorseQu_010163CD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Trigger1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Horse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Horse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiderSoul
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiderSoul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HorseAppearMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HorseAppearMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiderSoul2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiderSoul2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HorseSkull
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HorseSkull Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;alias_HorseSkull.GetReference().enable()
alias_RiderSoul.GetReference().disable(TRUE)
setObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
alias_RiderSoul.GetReference().disable()
alias_Trigger1.GetReference().disable()
setObjectiveCompleted(20,1)
setObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
alias_RiderSoul2.getReference().Disable(TRUE)
setStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
IntroScene.stop()
Actor Rider = alias_RiderSoul.getReference() as Actor
Rider.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
Game.GetPlayer().AddSpell(SummonAvrak)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetObjectiveCompleted(100,1)
alias_RiderSoul2.GetReference().Enable(TRUE)
SetObjectiveDisplayed(150,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
SetObjectiveCompleted(150,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property SummonAvrak  Auto  

Scene Property introScene  Auto  

