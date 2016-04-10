Scriptname DLC2dunNchardakReadingRoomSteam extends ObjectReference
{Script that lives on an XMarker. Controls the steam effects in the Reading Room, and lets MQ04 know we're in the Reading Room.}

Quest property DLC2MQ04 Auto

Event OnCellAttach()
	(DLC2MQ04 as DLC2MQ04Script).bInReadingRoomInterior = True
	if (((DLC2MQ04 as DLC2MQ04Script).bReadingRoomPowered))
		Self.Enable()
	Else
		Self.Disable()
	EndIf
EndEvent

Event OnCellDetach()
	(DLC2MQ04 as DLC2MQ04Script).bInReadingRoomInterior = False
EndEvent