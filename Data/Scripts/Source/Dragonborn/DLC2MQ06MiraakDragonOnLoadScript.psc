Scriptname DLC2MQ06MiraakDragonOnLoadScript extends ReferenceAlias  
{failsafe for tamed dragon - OnLoad move to safe location}

ObjectReference Property DLC2MQ06DragonLandingMarkerNear  Auto  

event OnLoad()
	if GetOwningQuest().GetStage() >= 300 && GetOwningQuest().GetStage() < 330
		GetActorRef().MoveTo(DLC2MQ06DragonLandingMarkerNear)
	endif
endEvent