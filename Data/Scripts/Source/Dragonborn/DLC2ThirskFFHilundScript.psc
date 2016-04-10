Scriptname DLC2ThirskFFHilundScript extends ReferenceAlias


Event OnDeath(Actor akKiller)
	; if (GetOwningQuest().GetStageDone(10))
		GetOwningQuest().SetStage(205)
	; endif
EndEvent

