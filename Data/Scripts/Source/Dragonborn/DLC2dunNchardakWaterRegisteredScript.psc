Scriptname DLC2dunNchardakWaterRegisteredScript extends ObjectReference

Keyword property LinkCustom10 Auto	;Linkedref to the water plane.
int property submergeHeight = 50 Auto		;Amount of water in which this object must be submerged before we act on it. Defaults to 100.
bool initialized
int updateType

Event OnCellLoad()
	(Self.GetLinkedRef(LinkCustom10) as DLC2dunNchardakWaterPlane).RegisterWaterObject(Self)
EndEvent

Function WaterUpdate(float waterZ)
	;ACTORS: If this is an actor, and it's dead, and it's submerged by more than 100u, disable it.
; 	;Debug.Trace("WaterUpdate for " + Self + ": " + waterZ + ": " + Self.GetPositionZ())
; 	;Debug.Trace("   " + ((Self as ObjectReference) as Actor) + ", " + ((Self as ObjectReference) as Actor).IsDead() + ", " + Self.GetPositionZ() + submergeHeight)
	if (((Self as ObjectReference) as Actor) != None && ((Self as ObjectReference) as Actor).IsDead() && Self.GetPositionZ() + submergeHeight < waterZ)
		;This object is preparing to disable. Unregister it.
		(Self.GetLinkedRef(LinkCustom10) as DLC2dunNchardakWaterPlane).UnregisterWaterObject(Self)
		updateType = 1
		RegisterForSingleUpdate(0.1)
	EndIf	
EndFunction

Event OnUpdate()
	if (updateType == 1)
; 		;Debug.Trace("DISABLING ACTOR: " + Self)
		Self.Disable(True)
		Self.Delete()
	EndIf
EndEvent