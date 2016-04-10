Scriptname DLC2NB01CorpseForce extends ObjectReference  


Event OnActivate(ObjectReference akActionRef)
	self.enable()
	Utility.Wait(1)
	self.ApplyHavokImpulse(0.0, 1.0, 0.0, 5.0)
EndEvent