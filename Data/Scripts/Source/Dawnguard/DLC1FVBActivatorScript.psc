Scriptname DLC1FVBActivatorScript extends ReferenceAlias  Conditional

ReferenceAlias Property pBookAlias Auto
int Property pDoOnce Auto

Event OnActivate(ObjectReference akActionRef)

	debug.trace(self +"OnActivate:" + akActionRef)

	pDoOnce += 1

	if pDoOnce == 1
		if akActionRef == Game.GetPlayer()
			Game.GetPlayer().AddItem(pBookAlias.GetRef(),1)
			GetRef().Disable()
		endif
	endif

endEvent