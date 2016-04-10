Scriptname DLC1dunHarkonStartDeferredKill extends ObjectReference

ReferenceAlias property HarkonAlias auto

Event OnCellAttach()
	(HarkonAlias as DLC1dunHarkonBossBattle).InitializeHarkonBattle()
EndEvent