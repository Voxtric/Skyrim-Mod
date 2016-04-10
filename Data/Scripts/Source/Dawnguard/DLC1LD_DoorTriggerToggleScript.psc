Scriptname DLC1LD_DoorTriggerToggleScript extends ObjectReference
{Script on a commentary trigger in DLC1Arkngthamz. Turns itself off if the player doesn't hit it in 60s.}

Function EnableDoorTrigger()
	Self.Enable()
	Utility.Wait(60)
	Self.Disable()
EndFunction