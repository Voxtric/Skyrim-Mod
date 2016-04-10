scriptname DLC1LD_AetheriumPedestalRef extends ObjectReference
{Notifies the DLC1LD Pedestal alias when it becomes attached.}

ReferenceAlias property PedestalTrigAlias Auto

Event OnCellAttach()
	;Debug.Trace("OnCellAttach received.")
	(PedestalTrigAlias as DLC1LD_AetheriumPedestal).ReferenceAttach()
EndEvent