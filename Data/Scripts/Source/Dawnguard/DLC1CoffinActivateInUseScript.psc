scriptName DLC1CoffinActivateInUseScript extends objectReference
{This script is to let the player open a coffin that is in use to talk to the actor sleeping in it}


event onActivate(objectReference ActivateRef)
	if ActivateRef == game.getPlayer() && self.isFurnitureInUse(abIgnoreReserved = True)
		self.playAnimation("Open")
	endif
endEvent
