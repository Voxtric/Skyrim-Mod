Scriptname DLC2ExpSpiderEggTESTSPAWNERSCRIPT extends ObjectReference Hidden 

Activator Property ActivatorToSpawn Auto
ActorBase Property ActorToSpawn Auto
Bool Property bNoSpawnOnCellAttach = FALSE Auto
ObjectReference RefThatSpawned

Event OnCellAttach()
	if bNoSpawnOnCellAttach == FALSE
		if ActivatortoSpawn
; 			debug.Trace("Spawning initial ACTOR " + ActivatortoSpawn + " at " + self)
			RefThatSpawned = self.PlaceAtMe(ActivatortoSpawn, 1)
		;elseif ActorToSpawn
; 		;	debug.Trace("Spawning initial ACTIVATOR " + ActorToSpawn + " at " + self)
		;	RefThatSpawned = self.PlaceAtMe(ActorToSpawn, 1)
		endif
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if ActivatorToSpawn
; 		debug.Trace("Attempting to spawn " + ActivatortoSpawn + " at " + self)
		if (RefThatSpawned == NONE) || (RefThatSpawned.IsDisabled())
; 			debug.Trace("Spawning " + ActivatortoSpawn + " at " + self)
			RefThatSpawned = self.PlaceAtMe(ActivatortoSpawn, 1)
		else
; 			debug.Trace("Didn't spawn ACTIVATOR because there's already one here")
		endif
	elseif ActorToSpawn
; 		debug.Trace("Attempting to spawn " + ActorToSpawn + " at " + self)
		if (RefThatSpawned == NONE) || (RefThatSpawned.IsDisabled()) || ((RefThatSpawned as Actor).IsDead())
; 			debug.Trace("Spawning " + ActorToSpawn + " at " + self)
			RefThatSpawned = self.PlaceAtMe(ActorToSpawn, 1)
		else
; 			debug.Trace("Didn't spawn ACTIVATOR because there's already one here")
		endif
	endif
EndEvent
