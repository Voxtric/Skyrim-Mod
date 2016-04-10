Scriptname BYOHRelationshipAdoptionCritterScript extends ReferenceAlias
{Script on the Critter Alias in RelationshipAdoption. Notifies RelationshipAdoption of events in the critter's lifecycle.}

Quest property BYOHRelationshipAdoption Auto


;Notify RelationshipAdoption when the critter dies (and if the player killed them).
Event OnDeath(Actor akKiller)
	(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).CritterDeath(akKiller)
EndEvent

