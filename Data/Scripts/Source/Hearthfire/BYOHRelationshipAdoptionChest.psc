Scriptname BYOHRelationshipAdoptionChest extends ReferenceAlias
{Used on the Chest alias in RelationshipAdoptionScheduler, this script catches activaton of the Child's Chest and notifies the main quest script.}

Quest property BYOHRelationshipAdoptionScheduler Auto

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		(BYOHRelationshipAdoptionScheduler as BYOHRelationshipAdoptionSc).PlayerChestInteraction()
	EndIf
EndEvent