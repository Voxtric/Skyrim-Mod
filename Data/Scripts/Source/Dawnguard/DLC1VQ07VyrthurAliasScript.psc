Scriptname DLC1VQ07VyrthurAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ07 Auto

Event OnDying(Actor akKiller)

	if pDLC1VQ07.GetStage() == 135
		pDLC1VQ07.SetStage(140)
	endif

endEvent