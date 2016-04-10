Scriptname BYOHHouseStewardScript extends ReferenceAlias Conditional

int Property houseIndex auto

Event OnDeath(Actor akKiller)
	(GetOwningQuest() as BYOHHouseBuildingScript).DismissSteward(houseIndex, GetActorRef())
endEvent