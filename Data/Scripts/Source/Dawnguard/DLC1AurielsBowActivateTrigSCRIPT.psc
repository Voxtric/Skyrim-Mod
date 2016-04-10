Scriptname DLC1AurielsBowActivateTrigSCRIPT extends ObjectReference Hidden 

import debug

Keyword Property LinkCustom01 Auto
{Link to Pedestal/Bow Anim}
Keyword Property LinkCustom02 Auto
{Link to Light}

Quest Property DLC1VQ07 Auto

Int Property StageToSet Auto
{Stage that gets set when this is activated.}

ReferenceAlias Property DLC1AurielsBow Auto

bool AlreadyLoaded = FALSE
bool AlreadyActivated = FALSE



Event OnCellLoad()
	;trace("Running OnCellLoad() with AlreadyLoaded set to " + AlreadyLoaded)
	;if AlreadyLoaded == FALSE
	;	trace("Running OnCellLoad() inside AlreadyLoaded if statement")
	;	GetLinkedRef(LinkCustom01).PlayAnimation("playanim02")
	;	AlreadyLoaded = TRUE
	;	self.DisableNoWait()
	;endif
EndEvent



Event OnActivate(ObjectReference akActionRef)
	if (AlreadyActivated == FALSE)
		if (akActionRef == Game.GetPlayer())
			AlreadyActivated = TRUE
			self.DisableNoWait()
			Game.GetPlayer().AddItem(DLC1AurielsBow.GetRef(), 1, 1)
			GetLinkedRef(LinkCustom02).DisableNoWait()
			GetLinkedRef(LinkCustom01).PlayAnimation("playanim02")
			DLC1VQ07.SetStage(StageToSet)
		endif
	endif
EndEvent


Function EnableBow()
	GetLinkedRef(LinkCustom01).PlayAnimation("playanim01")
	GetLinkedRef(LinkCustom02).EnableNoWait()
	self.EnableNoWait()
EndFunction