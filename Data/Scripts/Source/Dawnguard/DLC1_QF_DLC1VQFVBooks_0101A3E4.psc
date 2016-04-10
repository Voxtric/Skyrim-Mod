;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_QF_DLC1VQFVBooks_0101A3E4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1FVBBookEnglish02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBBookEnglish02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBBook04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBBook04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBBook03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBBook03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBActivatorBook02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBActivatorBook02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBActivatorBook01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBActivatorBook01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBBook02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBBook02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBBook01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBBook01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBBookEnglish01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBBookEnglish01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBUragAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBUragAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBActivatorBook04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBActivatorBook04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBBookEnglish03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBBookEnglish03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBActivatorBook03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBActivatorBook03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBHoldingSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBHoldingSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1FVBBookEnglish04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1FVBBookEnglish04 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;This stage will throw when the Player grabs a book for first time - points the right direction
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Done initial talk with Urag
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Add the Books and Move Player to Urag
Game.GetPlayer().AddItem(Alias_DLC1FVBBook01.GetRef())
Game.GetPlayer().AddItem(Alias_DLC1FVBBook02.GetRef())
Game.GetPlayer().AddItem(Alias_DLC1FVBBook03.GetRef())
Game.GetPlayer().AddItem(Alias_DLC1FVBBook04.GetRef())
Game.GetPlayer().MoveTo(Alias_DLC1FVBUragAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Auto-Inits on GameStart
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;All books traded and done
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
