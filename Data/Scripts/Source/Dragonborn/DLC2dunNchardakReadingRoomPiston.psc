Scriptname DLC2dunNchardakReadingRoomPiston extends ObjectReference
{Script for the pistons in the Reading Room, which start up if the room has steam power.}

Quest property DLC2MQ04 Auto

Event OnCellAttach()
	UnregisterForUpdate()
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnUpdate()
	if (Is3DLoaded())
		if ((DLC2MQ04 as DLC2MQ04Script).bReadingRoomPowered)
			((Self as ObjectReference) as DLC2DwePistonScript).Start()
		Else
			((Self as ObjectReference) as DLC2DwePistonScript).Stop()
		EndIf
	Else
		RegisterForSingleUpdate(1)
	EndIf
EndEvent