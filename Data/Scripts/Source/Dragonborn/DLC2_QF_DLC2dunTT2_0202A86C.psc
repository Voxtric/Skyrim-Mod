;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname DLC2_QF_DLC2dunTT2_0202A86C Extends Quest Hidden

;BEGIN ALIAS PROPERTY AshGuardianAct
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshGuardianAct Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gate1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gate1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gate2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gate2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ildari
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ildari Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;shut down stage
IldariScene01.stop()
IldariScene02.stop()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Alias_Gate1.getReference().setOpen(true)
;Alias_Gate2.getReference().setOpen(true)
(Alias_Ildari.getReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Alias_Gate2.getReference().setOpen(false)
(Alias_Ildari.getReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Alias_Gate1.getReference().setOpen(false)
(Alias_Ildari.getReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Ash Guardian
;utility.Wait(2)
IldariScene01.stop()
IldariScene02.start()
(Alias_AshGuardianAct.getReference()).Activate(Alias_Ildari.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player has entered Fort Cave Area
IldariCandlelight.cast(Alias_Ildari.getReference(), Alias_Ildari.getReference())
IldariScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
IldariScene01.stop()
IldariScene02.stop()
(Alias_Ildari.getReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property IldariScene01  Auto    

Scene Property IldariScene02  Auto  

SPELL Property IldariCandlelight  Auto  
