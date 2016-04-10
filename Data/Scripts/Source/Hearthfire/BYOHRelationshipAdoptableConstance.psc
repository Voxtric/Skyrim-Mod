scriptName BYOHRelationshipAdoptableConstance extends ReferenceAlias
{When Constance Michel dies, notify BYOHRelationshipAdoptableOrphanage of her death.}

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as BYOHRelationshipAdoptableOrphanageSc).ConstanceKilled()
EndEvent

