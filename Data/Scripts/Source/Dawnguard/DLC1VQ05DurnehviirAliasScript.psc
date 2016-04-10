Scriptname DLC1VQ05DurnehviirAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ05  Auto  
GlobalVariable Property pDLC1VQ05DurnehviirDeath Auto Conditional

Event OnDying(Actor akKiller)

	if pDLC1VQ05DurnehviirDeath.GetValue() == 0
		pDLC1VQ05.SetStage(80)
		pDLC1VQ05DurnehviirDeath.SetValue(1)
	endif

endEvent