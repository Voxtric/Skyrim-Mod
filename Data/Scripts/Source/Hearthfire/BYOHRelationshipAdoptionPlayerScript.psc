Scriptname BYOHRelationshipAdoptionPlayerScript extends ReferenceAlias
{Notifies BYOHRelationshipAdoptionScript that the player has moved to a new location.}

Quest property BYOHRelationshipAdoption Auto

;After adopting a child, whenever the player's location changes, notify the Adoption Quest.
;This is used for a variety of things: moving the family, triggering 'Welcome Home' forcegreets, etc.
Event OnLocationChange(Location oldLoc, Location newLoc)
	;Debug.Trace("Player OnLocationChange")
	(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).PlayerLocationChanged(newLoc, oldLoc)
EndEvent