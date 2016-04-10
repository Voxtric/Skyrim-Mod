Scriptname DLC2PillarActorDisablerScript extends ObjectReference  
{OnLoad, Disables this actor if the pillar toggle marker is also disabled }

ObjectReference Property PillarToggleMarkerRef auto
{REFERENCE PROPERTY - set this to the pillar toggle marker}

Event OnLoad()
	If PillarToggleMarkerRef.IsEnabled()
; 		debug.trace(self + "My Pillar enabled, enable me" + PillarToggleMarkerRef)
		Enable()
	else
; 		debug.trace(self + "My Pillar enabled, disable me" + PillarToggleMarkerRef)
		Disable()
	endif
	
EndEvent