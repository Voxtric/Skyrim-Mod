Scriptname DLC2TTR4aPlayerScript extends ReferenceAlias  

Quest Property DLC2TTR4a  Auto  

Event OnInit()
	RegisterForUpdate(5)
EndEvent

Event OnUpdate()
	if game.GetPlayer().GetActorValue("Variable05") > 0
		DLC2TTR4a.SetStage(200)
		UnregisterForUpdate()
	endif
EndEvent