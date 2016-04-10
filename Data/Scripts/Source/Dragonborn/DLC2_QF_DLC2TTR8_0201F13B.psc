;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC2_QF_DLC2TTR8_0201F13B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Elynea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Elynea Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Elynea dies, remove objective

SetObjectiveDisplayed(101, false)
SetObjectiveDisplayed(102, false)
SetObjectiveDisplayed(103, false)
SetObjectiveDisplayed(104, false)
SetObjectiveDisplayed(105, false)
SetObjectiveDisplayed(106, false)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; set the desired ingredient

float OldValue

OldValue = DLC2TTR8Ingredient.GetValue()

While DLC2TTR8Ingredient.GetValue() == OldValue
    DLC2TTR8Ingredient.SetValue(utility.RandomInt(1, 6))
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player gets paid

CompleteAllObjectives()

if DLC2TTR8Ingredient.GetValue() == 1
    game.GetPlayer().AddItem(Gold, 350)
elseif DLC2TTR8Ingredient.GetValue() == 6
    game.GetPlayer().AddItem(Gold, 200)
else
    game.GetPlayer().AddItem(Gold, 100)
endif

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Player has been given the task
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

GlobalVariable Property DLC2TTR8Ingredient  Auto  
