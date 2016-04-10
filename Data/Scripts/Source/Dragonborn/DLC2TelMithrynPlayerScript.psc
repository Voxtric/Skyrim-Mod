Scriptname DLC2TelMithrynPlayerScript extends ReferenceAlias

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akNewLoc == DLC2TelMithrynLocation
		If DLC2TalvasRef.IsPlayerTeammate() == false
			DLC2TalvasRef.AddToFaction(JobMerchantFaction)
		EndIf
	endif
EndEvent

Location Property DLC2TelMithrynLocation  Auto  

Faction Property JobMerchantFaction  Auto  

Actor Property DLC2TalvasRef  Auto  
