Scriptname DCL1VampireTurnPlayerScript extends ReferenceAlias  
{Script on Player alias in DLC1VampireTurn quest}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Debug.Trace(self + "OnLocationChange()")
	(GetOwningQuest() as DLC1VampireTurnScript).PlayerChangedLocationCompleteChange()
EndEvent


Event OnPlayerLoadGame()
	;handles giving people player turned into vampires red eyes if the game loads
	Debug.Trace(self + "OnPlayerLoadGame() calling MakeAliasesEyesRed()")
	(GetOwningQuest() as DLC1VampireTurnScript).MakeAliasesEyesRed()
 	
EndEvent