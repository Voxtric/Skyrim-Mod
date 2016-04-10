;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC2_QF_DLC2SV02_0201CAF1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Map
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Map Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Baldor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Baldor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NorthShoreThalmor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NorthShoreThalmor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ancarion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ancarion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodgeThalmor4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LodgeThalmor4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodgeThalmor3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LodgeThalmor3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Deor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Deor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lodge
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Lodge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NorthShoreLanding
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NorthShoreLanding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NorthShoreThalmor3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NorthShoreThalmor3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodgeThalmor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LodgeThalmor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodgeKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LodgeKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NorthShoreThalmor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NorthShoreThalmor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LodgeThalmor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LodgeThalmor1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Remove the map from the player's inventory
; Debug.Trace(self + "Map: " + Alias_Map.GetReference())
Game.GetPlayer().RemoveItem(DLC2SV02Map, 1)

;Add the Stahlrim Source location to the player's map if not already visible
DLC2StalhrimSourceMapMarkerREF.enable()
   if DLC2StalhrimSourceMapMarkerREF.IsMapMarkerVisible() == false
      DLC2StalhrimSourceMapMarkerREF.AddToMap()
   endif

;Turn off the Thalmor and their boat if they agreed to leave
if DLC2SV02ThalmorLeave.GetValue() == 1
   DLC2POI8CrabMarker.Enable()
endif

;Start quest SV01
DLC2SV01.Start()

AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(40)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Set when the player agrees to sell Stalhrim items to Ancarion
;Used as a condition on the Vendor tab of Ancarion's merchant services faction
DLC2SV02AncarionMerchant.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
DLC2POI01Enabled.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Set when the Thalmor guard at Ancarion has force-greted the player
;Used to prevent repetitive force-greets
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Manage objectives
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;MoveBaldor back to the village
Alias_Baldor.GetActorRef().MoveTo(DLC2SVPatrolMarkerA3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_3 in script DLC2_QF_DLC2SV02_0201CAF1
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Enable the ship, Ancarion and his Thalmor guards
DLC2POI8CrabMarker.Disable()

;Manage objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2SV01TharstanMarker  Auto  

ObjectReference Property DLC2SVTharstanRef  Auto  

Quest Property DLC2SV02Misc  Auto  

ObjectReference Property DLC2POI8CrabMarker  Auto  

GlobalVariable Property DLC2SV02ThalmorLeave  Auto  

ObjectReference Property DLC2POI01Disabled  Auto  

ObjectReference Property DLC2POI01Enabled  Auto  

Quest Property DLC2SV02AncarionMerchant  Auto  

Quest Property DLC2SV01  Auto  

ObjectReference Property DLC2SVPatrolMarkerA3  Auto  

Quest Property DLC2SV01Post  Auto  

ObjectReference Property DLC2StalhrimSourceMapMarkerREF  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Book Property DLC2SV02Map  Auto  
