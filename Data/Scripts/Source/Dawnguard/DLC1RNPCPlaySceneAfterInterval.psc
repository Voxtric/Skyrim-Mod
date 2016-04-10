Scriptname DLC1RNPCPlaySceneAfterInterval extends ObjectReference  
{Designed to be slapped on objects that also have DLC1defaultDetectPresenceTriggerScript. If the player stays in them for a while, a scene will play.}


int Property SecondsToWait auto
Scene Property DesiredScene auto

Event OnTriggerEnter(ObjectReference akActivator)
	Debug.Trace("RNPC: Player entered trigger, waiting...")
	if (akActivator == Game.GetPlayer())
		Utility.Wait(SecondsToWait)
		DLC1defaultDetectPresenceTriggerScript me = (self as ObjectReference) as DLC1defaultDetectPresenceTriggerScript
		if ((me != None) && (me.PresenceDetected == true))
			if (DesiredScene != None)
				Debug.Trace("RNPC: Player still in trigger after " + SecondsToWait + "; starting scene: " + DesiredScene)
				DesiredScene.Start()
				Delete()
			endif
		endif
	endif
EndEvent
