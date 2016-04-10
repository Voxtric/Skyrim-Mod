Scriptname DLC1RadiantTrollFollowerScript extends ReferenceAlias  
{Attached to TrollFollower alias in DLC1Radiant quest}

int hoursUntilAbandoned = 5


Event OnDeath(Actor akKiller)
	(GetOwningQuest() as DLC1RadiantScript).TrollDies()
EndEvent

Event OnUpdateGameTime()

	cell parentCell = GetReference().GetParentCell()

	if parentCell == None || parentCell.IsAttached() == false
		(GetOwningQuest() as DLC1RadiantScript).TrollAbandoned(GetActorReference())
	endif

EndEvent

Event OnCellDetach()
	RegisterForSingleUpdateGameTime(hoursUntilAbandoned)
EndEvent

Event OnDetachedFromCell()
	RegisterForSingleUpdateGameTime(hoursUntilAbandoned)
EndEvent

Event OnCellAttach()
	UnregisterForUpdateGameTime()
EndEvent

Event OnAttachedToCell()
	UnregisterForUpdateGameTime()
EndEvent