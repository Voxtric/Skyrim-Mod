Scriptname DLC2QASpawnNPCList extends ObjectReference  
{Displays a list of NPCs that the player can spawn.}

;Location that the NPC the player selects will spawn
ObjectReference Property SpawnLocation  Auto  

;List of NPCs that the player can spawn
FormList Property NPCList  Auto  

;Interface that lets the player choose an NPC to spawn.
Message Property NPCOptions Auto


event onCellAttach()
	;Keep the button closed if the form list is empty
	if  NPCList.GetSize() == 0 
		playAnimation("Close")
	else
		playAnimation("Open")
	endIf
endEvent


auto state open
	event onActivate(objectReference akActivator)

		goToState("waiting")
		playAnimationAndWait("Trigger01","done")

		;Spawn the NPC of the player's choice
		int playerChoice = NPCOptions.Show()		
		SpawnLocation.placeatme(NPCList.GetAt(playerChoice))

		goToState("Open")
	endEvent
endState

state waiting
endState