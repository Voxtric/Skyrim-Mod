Scriptname DLC2dunBloodskalBossScript extends Actor  

bool property killedOnce auto hidden
objectReference property DLC2BloodskalBossExitPortullis auto
objectReference property DLC2BloodskalBossEntrancePortcullis auto
default2stateActivator property ExitDoor auto hidden
default2stateActivator property EntranceDoor auto hidden

event onDeath(actor akKiller)
	if !killedOnce
		killedOnce = True
		ExitDoor = DLC2BloodskalBossExitPortullis as default2stateActivator
		EntranceDoor = DLC2BloodskalBossEntrancePortcullis as default2stateActivator
		ExitDoor.setOpen(True)
		EntranceDoor.setOpen(True)
	endif
endEvent
