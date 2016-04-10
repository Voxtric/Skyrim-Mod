scriptName BYOHRelationshipAdoptableLetter extends ObjectReference
{When the player reads Constance's Letter ('Consider Adoption'), notify the Adoptable quest so it can display an objective if appropriate.}

Quest property BYOHRelationshipAdoptable Auto

Event OnRead()
	(BYOHRelationshipAdoptable as BYOHRelationshipAdoptableScript).ShowOrphanageObjective(1)
EndEvent

