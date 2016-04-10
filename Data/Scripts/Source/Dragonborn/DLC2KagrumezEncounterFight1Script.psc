Scriptname DLC2KagrumezEncounterFight1Script extends Actor  

globalvariable property fight1Global auto
objectReference property consoleMaster auto

Event onInit()
;start combat with the player immediately upon enabling
	startCombat(Game.getPlayer())
endEvent

Event onDying(Actor killer)
;increments a global variable on death so I can keep track how many encounters have been killed
	fight1Global.Mod(1)
	consoleMaster.Activate(consoleMaster)
EndEvent