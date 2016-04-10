Scriptname DLC1dunHarkonShrineSlipTrigger extends ObjectReference  

ReferenceAlias property HarkonAlias Auto

Event OnTrigger(ObjectReference triggerRef)
	if (triggerRef == HarkonAlias.GetActorRef() && (HarkonAlias as DLC1dunHarkonBossBattle).HarkonBossBattleState == 4)
		;If Harkon slips off the shrine, emergency-abort the shrine event to prevent the battle from breaking.
		(HarkonAlias as DLC1dunHarkonBossBattle).SetupShrineEvent((HarkonAlias as DLC1dunHarkonBossBattle).LastShrineEvent)
	EndIf
EndEvent