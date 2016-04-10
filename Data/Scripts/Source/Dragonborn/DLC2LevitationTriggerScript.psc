Scriptname DLC2LevitationTriggerScript extends ObjectReference  
{put actors that enter the trigger in a scene}

EVENT onTriggerEnter(objectReference triggerRef)
	actor triggerActor = triggerRef as Actor
; 	debug.trace(self + " triggered by " + triggerActor)
	; put actor in alias then in scene, if scene isn't already running
	if triggerActor && triggerActor.HasKeyword(ActorTypeNPC) && triggerActor != Game.GetPlayer() && DLC2TelMithrynLevitationScene.IsPlaying() == false
		LevitationActor.ForceRefTo(triggerActor)
		DLC2TelMithrynLevitationScene.Start()
	endif
endEvent

ReferenceAlias Property LevitationActor  Auto  

Scene Property DLC2TelMithrynLevitationScene  Auto  

Keyword Property ActorTypeNPC Auto
