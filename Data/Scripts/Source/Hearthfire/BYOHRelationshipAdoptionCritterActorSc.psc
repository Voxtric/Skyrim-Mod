Scriptname BYOHRelationshipAdoptionCritterActorSc extends Actor
{Script on the Critter Base Actors to scale their size down.}

float property scale Auto

Event OnLoad()
	Self.SetScale(scale)
EndEvent
