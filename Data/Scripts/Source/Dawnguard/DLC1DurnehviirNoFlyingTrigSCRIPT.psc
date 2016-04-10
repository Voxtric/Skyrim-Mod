Scriptname DLC1DurnehviirNoFlyingTrigSCRIPT extends ObjectReference  
{If Durnehviir (Based on his keyword) enters this trigger it will restrict him from flying until he leaves the trigger.
Also sets DLC1DurnehviirDisallowFlyingGLOBAL to 1 on enter, and 0 on exit.}

GlobalVariable Property DLC1DurnehviirDisallowFlying Auto

ActorBase Property DLC1Durnehviir1 Auto

ObjectReference Property triggerDragonRef Auto

Event onTriggerEnter(ObjectReference triggerRef)

	triggerDragonRef = triggerRef

	DLC1DurnehviirDisallowFlying.SetValue(1)
	(triggerRef as Actor).SetAllowFlying(FALSE)
	debug.Trace(triggerRef + " DRAGON has entered trigger and Global = " + (DLC1DurnehviirDisallowFlying.GetValue()))

EndEvent


Event OnTriggerLeave(ObjectReference triggerRef)

	DLC1DurnehviirDisallowFlying.SetValue(0)
	(triggerRef as Actor).SetAllowFlying(TRUE)
	debug.Trace(triggerRef + " DRAGON has left trigger and Global = " + (DLC1DurnehviirDisallowFlying.GetValue()))

EndEvent