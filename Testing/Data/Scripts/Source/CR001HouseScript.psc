Scriptname CR001HouseScript extends ReferenceAlias  

Location Property WorkersHouse  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akOldLoc == WorkersHouse && GetOwningQuest().GetStage() < 60
		GetOwningQuest().SetStage(60)
	endif

	if akNewLoc == WorkersHouse && GetOwningQuest().GetStage() == 20
		GetOwningQuest().SetStage(30)
	endif
endevent