;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC2_QF_DLC2dunKolbjornQST_03009BC5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Altris
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Altris Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
DLC2dunKolbjornExt_Stage02_Enable.Enable()
DLC2dunKolbjornExt_Stage02_Disable.Disable()
DLC2dunKolbjornInt_Stage02_Enable.Enable()
DLC2dunKolbjornInt_Stage02_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
DLC2dunKolbjornExt_Stage04_Enable.Enable()
DLC2dunKolbjornExt_Stage04_Disable.Disable()
DLC2dunKolbjornInt_Stage04_Enable.Enable()
DLC2dunKolbjornInt_Stage04_Disable.Disable()
Alias_Altris.GetActorRef().MoveTo(DLC2dunKolbjornAltrisBossMarker)
Alias_Altris.GetActorRef().SetAV("Aggression", 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
DLC2dunKolbjornExt_Stage01_Enable.Enable()
DLC2dunKolbjornExt_Stage01_Disable.Disable()
DLC2dunKolbjornInt_Stage01_Enable.Enable()
DLC2dunKolbjornInt_Stage01_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
DLC2dunKolbjornExt_Stage03_Enable.Enable()
DLC2dunKolbjornExt_Stage03_Disable.Disable()
DLC2dunKolbjornInt_Stage03_Enable.Enable()
DLC2dunKolbjornInt_Stage03_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2dunKolbjornExt_Stage00_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage00_Disable  Auto

ObjectReference Property DLC2dunKolbjornExt_Stage01_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage01_Disable  Auto

ObjectReference Property DLC2dunKolbjornExt_Stage02_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage02_Disable  Auto

ObjectReference Property DLC2dunKolbjornExt_Stage03_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage03_Disable  Auto

ObjectReference Property DLC2dunKolbjornExt_Stage04_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage04_Disable  Auto

ObjectReference Property DLC2dunKolbjornInt_Stage01_Enable  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage01_Disable Auto  

ObjectReference Property DLC2dunKolbjornInt_Stage02_Enable  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage02_Disable Auto  

ObjectReference Property DLC2dunKolbjornInt_Stage03_Enable  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage03_Disable Auto  

ObjectReference Property DLC2dunKolbjornInt_Stage04_Enable  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage04_Disable Auto  

ObjectReference Property DLC2dunKolbjornAltrisBossMarker  Auto  
