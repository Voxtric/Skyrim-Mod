Scriptname DLC1RadiantPlayerScript extends ReferenceAlias  
{Script on Player alias in DLC1_Radiant quest}

DLC1RadiantScript Property DLC1Radiant auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	DLC1Radiant.CreateQuestBasedOnLocation(akNewLoc)
EndEvent