Scriptname DLC2dunNchardakWaterfallScript extends ObjectReference
{Script on the waterfalls in Nchardak. Enables or disables them as the water height in the room changes.}

int property DisableStage = -1 auto
{When the water plane falls to or below this stage, disable the waterfall (this object). When it rises above it, enable the waterfall.}

Event OnActivate(ObjectReference akActivator)
	if (DisableStage >= 0)
		DLC2dunNchardakWaterPlane waterPlane = (akActivator as DLC2dunNchardakWaterPlane)
		if ((akActivator as DLC2dunNchardakWaterPlane).myWaterStage <= DisableStage)
			Self.Disable(True)
			if (Self.GetLinkedRef())
				GetLinkedRef().Activate(Self)
			EndIf
		Else
			Self.Enable(True)
		EndIf
	EndIf
EndEvent