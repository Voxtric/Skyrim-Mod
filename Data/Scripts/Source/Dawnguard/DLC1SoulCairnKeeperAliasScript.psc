Scriptname DLC1SoulCairnKeeperAliasScript extends ReferenceAlias  Conditional

GlobalVariable Property pDLC1VQ05KeeperDead Auto Conditional
GlobalVariable Property pDLC1VQ05KeepersKilled Auto
GlobalVariable Property pDLC1VQ05KeepersTotal Auto
Quest Property pDLC1VQ05 Auto
DLC1VQ05QuestScript Property pDLC1VQ05QS Auto

Event OnDying(Actor akKiller)

	if pDLC1VQ05KeeperDead.GetValue() == 0
		pDLC1VQ05KeeperDead.SetValue(1)
	endif

	if pDLC1VQ05.GetStage() == 30
		if pDLC1VQ05.ModObjectiveGlobal(1, pDLC1VQ05KeepersKilled, 30, pDLC1VQ05KeepersTotal.value)
	  		pDLC1VQ05.SetStage(40)
		endif
	elseif pDLC1VQ05.GetStage() < 30
		pDLC1VQ05KeepersKilled.SetValue(pDLC1VQ05KeepersKilled.GetValue() + 1)
			if pDLC1VQ05KeepersKilled.GetValue() >= 3
				pDLC1VQ05QS.AltKeepersDie()
			endif
	endif

endEvent