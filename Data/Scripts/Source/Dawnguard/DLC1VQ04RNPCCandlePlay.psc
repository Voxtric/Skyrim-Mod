Scriptname DLC1VQ04RNPCCandlePlay extends ObjectReference  



Scene Property OpenScene auto


Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		OpenScene.Start()
	endif
EndEvent


