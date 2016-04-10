Scriptname DLC2DweWallAnimScript extends ObjectReference  

bool property startsUp = false auto
bool property isUp = false auto hidden

Event OnCellAttach()
	if startsUp == true
		playAnimation("stage1")
		isUp = true
	endif
EndEvent

Event onActivate(objectReference Actronaut)
	if isUp == false
		playAnimation("stage1")
		isUp = true
	elseif isUp == true
		playAnimation("stage2")
		isUp = false
	endif
EndEvent