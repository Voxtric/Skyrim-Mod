;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname DLC2_PRKF_DLC2TTR5BriarheartH_0201C05B Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; collect briarheart

akTargetRef.RemoveItem(Briarheart, 1)
akActor.AddItem(Briarheart, 1)

DLC2TTR5.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2TTR5  Auto  

Ingredient Property BriarHeart  Auto  
