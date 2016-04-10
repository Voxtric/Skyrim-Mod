Scriptname dlc2Book02DungeonIslandScript extends ObjectReference  

objectReference Property island auto
objectReference Property bridge01 auto
objectReference Property bridge02 auto

Auto State Waiting
	Event OnActivate(objectReference Actronaut)
	island.translateTo(0, 0, 0, 0, 0, 0, 10)
	EndEvent
EndState

State Done
;do nothing
EndState