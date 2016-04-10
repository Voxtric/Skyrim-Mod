Scriptname DLC1VQ07TempleBasinAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ07  Auto  

Event OnActivate(ObjectReference akActionRef)

	if pDLC1VQ07.GetStage() == 100
		if akActionRef == Game.GetPlayer()
			pDLC1VQ07.SetStage(110)
		endif
	endif

endEvent