Scriptname DLC2KagrumezEncounterScript extends Actor  

globalvariable property fightCountGlobal auto
objectReference property consoleMaster auto


;Event onInit()
;start combat with the player immediately upon enabling
;	startCombat(Game.getPlayer())
;endEvent

auto State waiting
Event onDying(Actor killer)
;increments a global variable on death so I can keep track how many encounters have been killed
	gotoState("allDone")
	fightCountGlobal.Mod(1)
	consoleMaster.Activate(consoleMaster)
EndEvent
EndState

State allDone
EndState