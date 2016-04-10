Scriptname DLC2ApoWarpBookScript extends ObjectReference  

objectReference property invisibleDoor auto hidden
message property notInCombat auto 

Event onCellAttach()
	invisibleDoor = self.getLinkedRef()
EndEvent

Event onActivate(objectReference Actronaut)
	if Actronaut == Game.getPlayer() && game.getPlayer().isinCombat() == false
		invisibleDoor.Activate(game.getPlayer())
	elseif game.getPlayer().isinCombat() == true
		notInCombat.Show()
	endif
EndEvent