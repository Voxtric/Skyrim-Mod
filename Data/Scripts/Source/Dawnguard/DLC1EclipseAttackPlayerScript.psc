Scriptname DLC1EclipseAttackPlayerScript extends ReferenceAlias  
{Script attached to Player Alias in DLC1EclipseX quests}

locationAlias Property Habitation auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	location HabitationLoc = Habitation.GetLocation()

	if Game.GetPlayer().IsInLocation(HabitationLoc) == false
		Debug.Trace(self + "OnLocationChange() stopping quest, player is not in:" + HabitationLoc)
		GetOwningQuest().stop()
	endif

EndEvent