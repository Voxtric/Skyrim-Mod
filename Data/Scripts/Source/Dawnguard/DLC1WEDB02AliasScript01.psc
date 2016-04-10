Scriptname DLC1WEDB02AliasScript01 extends ReferenceAlias Hidden 
{For werewolf so the quest stops when he's unloaded, or dead.}

Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(255)
endEvent

Event OnCellDetach()
	GetOwningQuest().SetStage(255)
endEvent