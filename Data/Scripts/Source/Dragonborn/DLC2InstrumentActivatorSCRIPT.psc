Scriptname DLC2InstrumentActivatorSCRIPT extends ObjectReference  

Spell Property mySpell Auto

Event OnActivate(ObjectReference akActionRef)
	Actor myActor = akActionRef as Actor
	myActor.AddSpell(mySpell)
EndEvent
