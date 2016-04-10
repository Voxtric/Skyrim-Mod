Scriptname DLC1SoulCairnKeeperSCRIPT extends Actor
;on Cell Attach, check to see if the other two Keepers are dead.  If they are, enable the hard marker

import Debug
import Utility

Actor Property KeeperB  Auto  
Actor Property KeeperC  Auto  
;The other two DLC1SoulCairnKeeperSCRIPT

objectReference Property SoulEnabler Auto
;Marker that disables souls around spire

Keyword Property EnableLink auto
;keyword for linked HardEnabler (Enable Marker that enables all additional ambushes, etc)

event onCellAttach()
	if ((KeeperB.IsDead() == TRUE) && (KeeperC.IsDead() == TRUE))
		;Notification("Enable Harder")
		GetLinkedRef(EnableLink).enable()	
	endif
endEvent

event OnDeath(Actor akKiller)
;	wait(10.0)
;	Game.RequestAutoSave()
	SoulEnabler.disable()
endEvent
