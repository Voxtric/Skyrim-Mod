Scriptname DLC1DrawKnifeScript extends ObjectReference  Conditional

ReferenceAlias Property pDLC1VQ06DrawKnifeAlias Auto
Quest Property pDLC1VQ06 Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC1VQ06.IsRunning() == 1
			Game.GetPlayer().AddItem(pDLC1VQ06DrawKnifeAlias.GetRef())
			Self.Disable()
		endif
	endif

endEvent