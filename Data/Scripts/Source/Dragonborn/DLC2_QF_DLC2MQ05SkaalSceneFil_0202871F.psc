;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 51
Scriptname DLC2_QF_DLC2MQ05SkaalSceneFil_0202871F Extends Quest Hidden

;BEGIN ALIAS PROPERTY SkaalCitizenAeta
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenAeta Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenFanari
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenFanari Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenFinna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenFinna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenEdla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenEdla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenBaldor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenBaldor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenOslaf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenOslaf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenNikulas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenNikulas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenDeor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenDeor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenMorwen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenMorwen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenTharstan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenTharstan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenYrsa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenYrsa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenWulf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenWulf Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
; fill MQ05 aliases with my aliases
int iArrayIndex = 0
while iArrayIndex < myAliases.length
	; if something is in myAlias, put it into matching MQ05 alias
; 	debug.trace(self + " trying to fill alias " + iArrayIndex + ": " + myAliases[iArrayIndex].GetRef())
	if myAliases[iArrayIndex].GetRef() && myAliases[iArrayIndex].GetRef().IsInLocation(DLC2SkaalVillageLocation)
		MQ05SkaalCitizenAliases[iArrayIndex].ForceRefTo(myAliases[iArrayIndex].GetRef())
; 		debug.trace(self + " SUCCESS")
	else
; 		debug.trace(self + " FAILED")
	endif
	iArrayIndex = iArrayIndex + 1
endWhile

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MQ05  Auto  

ReferenceAlias[] Property MQ05SkaalCitizenAliases  Auto  

ReferenceAlias[] Property MyAliases  Auto  

Location Property DLC2SkaalVillageLocation  Auto  
