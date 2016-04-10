Scriptname DLC2HermaeusMoraIntroCheckScript extends ObjectReference  
{checks for HM intro on load (once)
}

DLC2BookDungeonControllerScript Property DLC2BookDungeonController  Auto  

event OnLoad()
	DLC2BookDungeonController.Book01DungeonHMIntro()
endEvent
