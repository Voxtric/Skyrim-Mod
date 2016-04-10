Scriptname DLC2ExpSpiderPackmuleSCRIPT extends ObjectReference Hidden 

Quest Property DLC2ExpSpiderQuest Auto
Bool Property bIsFriendly = FALSE Auto
Bool Property bAlreadyForcedRef = FALSE Auto Hidden


Event OnLoad()
	ObjectReference mySelf = self

	if bIsFriendly
		(mySelf as Actor).SetPlayerTeammate()
; 		;debug.Trace("I'm a friendly spider, attempting to add myself to the list of spawned spiders" + self)
		if !bAlreadyForcedRef
			(DLC2ExpSpiderQuest as DLC2ExpPackSpiderAliasArrayScript).ForceRefInto(mySelf)
			bAlreadyForcedRef = TRUE
		endif
	endif
EndEvent

Event OnActivate(ObjectReference akActivateRef)
	ObjectReference mySelf = self

	;debug.notification("Activating spider!")
	;GetLinkedRef().Activate(Game.GetPlayer())
	(mySelf as Actor).UnequipAll()
	(mySelf as Actor).OpenInventory(true)
EndEvent