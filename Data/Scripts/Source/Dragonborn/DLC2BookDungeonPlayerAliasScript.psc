Scriptname DLC2BookDungeonPlayerAliasScript extends ReferenceAlias  

bool bInBleedout

Event OnEnterBleedout()
;  	Debug.Trace(self + "player enters bleedout")
	if bInBleedout == false
		bInBleedout = true
		(GetOwningQuest() as DLC2BookDungeonControllerScript).PlayerInBleedout()
		bInBleedout = false
	else
; 	 	Debug.Trace(self + "ALREADY IN BLEEDOUT - ignoring second call")
	endif
EndEvent
