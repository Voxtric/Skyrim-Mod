Scriptname DLC1ArkngthamzDestructionSCRIPT extends ObjectReference Hidden 

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto

Bool isDestroyed = FALSE

Event OnActivate(ObjectReference akActionRef)

	GetLinkedRef().Activate(self)
	Utility.Wait(0.25)
	DamageObject(1000)
	if (GetLinkedRef(LinkCustom01))
		GetLinkedRef(LinkCustom01).Activate(self)
	endif
	if (GetLinkedRef(LinkCustom02))
		GetLinkedRef(LinkCustom02).Activate(self)
	endif
	if (GetLinkedRef(LinkCustom03))
		GetLinkedRef(LinkCustom03).Activate(self)
	endif

	isDestroyed = TRUE

EndEvent


;Event OnCellDetach()
;	if isDestroyed
;		Disable()
;	endif
;EndEvent