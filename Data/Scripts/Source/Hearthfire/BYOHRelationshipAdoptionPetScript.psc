Scriptname BYOHRelationshipAdoptionPetScript extends ReferenceAlias
{Script on the Pet Alias in RelationshipAdoption. Notifies RelationshipAdoption of events in the pet's lifecycle.}

Quest property BYOHRelationshipAdoption Auto


;Notify RelationshipAdoption when the pet dies (and if the player killed them).
Event OnDeath(Actor akKiller)
	(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).PetDeath(akKiller)
EndEvent

;Notify RelationshipAdoption when the pet's 3D has unloaded.
;If the player has dismissed them, this often results in them being warped home.
Event OnUnload()
	(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).PetUnloaded()
EndEvent

