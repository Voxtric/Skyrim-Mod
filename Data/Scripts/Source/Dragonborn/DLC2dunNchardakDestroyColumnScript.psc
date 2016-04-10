Scriptname DLC2dunNchardakDestroyColumnScript extends ObjectReference  
{Script for the destructible column in the Nchardak aqueduct.}

ObjectReference property DestructibleColumn Auto
ObjectReference property DestructibleColumnCollision Auto
Sound property OBJNchardakColumnCrumble Auto

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
; 		;Debug.Trace("Destroying " + DestructibleColumn + " and disabling " + DestructibleColumnCollision)
		GoToState("Done")
		Utility.Wait(1.5)
		OBJNchardakColumnCrumble.Play(DestructibleColumn)
		DestructibleColumn.DamageObject(75)
		DestructibleColumnCollision.Disable()
		Self.Disable()
		Self.Delete()
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState

Event OnActivate(ObjectReference akActivator)
	GoToState("Waiting")
	OnActivate(akActivator)
EndEvent