Scriptname DLC01WESC09Script extends ReferenceAlias  
{Script attached to Taron Dreth on WESC09. EVPs him more frequently to make sure his forcegreet fires}

bool loopActive = False

Event OnLoad()
	loopActive = True
	RunLoop()
EndEvent

Event OnUnload()
	loopActive = False
EndEvent

Function RunLoop()
	While (loopActive)
		Utility.Wait(5)
		Self.GetActorRef().EvaluatePackage()
	EndWhile
EndFunction