Scriptname DLC2SV01St10DoorScript extends ObjectReference  
;{When the player activates the door, if the quest is on stage 10 and Tharstan's 3D isn't loaded, move Tharstan into the dungeon}

ObjectReference Property DLC2SVTharstanRef  Auto  
ObjectReference Property DLC2SV01TharstanMarker  Auto  

Event OnActivate(ObjectReference ActivateRef)
	if !(DLC2SVTharstanRef.Is3DLoaded()) && ActivateRef == Game.GetPlayer()
		DLC2SVTharstanRef.MoveTo(DLC2SV01TharstanMarker)
	endif		
EndEvent
Quest Property DLC2SV01  Auto  
