ScriptName DLC2dunHaknirPOIRieklingScript extends ObjectReference
{For Haknir POI 4, Activate this object's linkedref when the cell attaches.}

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
bool done

Event OnCellAttach()
; 	Debug.Trace("ATTACHED with " + (!Self.GetLinkedRef(LinkCustom01).IsDisabled()))
	if (!Self.GetLinkedRef(LinkCustom01).IsDisabled() && !done)
		done = True
		RegisterForSingleUpdate(1)
	EndIf
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
; 	Debug.Trace("Updating")
	if (Game.GetPlayer().GetDistance(Self.GetLinkedRef(LinkCustom02)) < 2000)
; 		Debug.Trace("Activating " + GetLinkedRef())
		GetLinkedRef().Activate(Self)
	Else
		RegisterForSingleUpdate(1)
	EndIf
EndEvent