;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_CR001Grandmother_02000D65 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CR001Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CR001Door Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrollKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrollKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CR001Agrax
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CR001Agrax Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CR001Troll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CR001Troll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CR001Shoes
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CR001Shoes Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_Cr001Troll.GetReference().Enable()
Alias_PlayerREF.GetReference().AddItem(Alias_CR001Shoes.GetReference())
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_CR001Door.GetReference().SetLockLevel(0)
Alias_CR001Door.GetReference().Lock(false)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_CR001Troll.GetReference().Disable()
SetObjectiveCompleted(30)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_CR001Door.GetReference().SetLockLevel(100)
Alias_CR001Door.GetReference().Lock()
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
