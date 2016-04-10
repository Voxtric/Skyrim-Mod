Scriptname DLC1VQ05ESBloodActivatorScript extends ObjectReference  

Quest Property pDLC1VQ05 Auto
ReferenceAlias Property pDLC1VQ05ESThreeAlias Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		Self.Disable()
		Game.GetPlayer().AddItem(pDLC1VQ05ESThreeAlias.GetRef())
	endif

endEvent