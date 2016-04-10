Scriptname DLC1AurielsShieldScript extends ObjectReference Hidden 

GlobalVariable Property TimesHit Auto
GlobalVariable Property CurrentStage Auto

Event OnLoad()
	debug.trace("Checking shield state")
	if CurrentStage.GetValue() == 1
		;debug.Notification("Shield at LEVEL 1")
		self.SetAnimationVariableFloat("fDampRate", 1)
		self.SetAnimationVariableFloat("fToggleBlend", 0.75)
	elseif CurrentStage.GetValue() == 2
		;debug.Notification("Shield at LEVEL 2")
		self.SetAnimationVariableFloat("fDampRate", 1)
		self.SetAnimationVariableFloat("fToggleBlend", 0.85)
	elseif CurrentStage.GetValue() == 3
		;debug.Notification("Shield at LEVEL 3")
		self.SetAnimationVariableFloat("fDampRate", 1)
		self.SetAnimationVariableFloat("fToggleBlend", 1)
	endif
EndEvent