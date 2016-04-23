Scriptname DSBossScript extends ReferenceAlias  

Quest Property DwemerSecrets  Auto  

Event OnCombatStateChanged(Actor akTarget, Int aeCombatState)
if aeCombatState == 1
	DwemerSecrets.SetStage(91)
endif
endevent

Event OnDeath(Actor akKiller)
DwemerSecrets.SetStage(92)
endevent