Scriptname BYOHPlanterSoilScript extends ObjectReference  

import debug
import utility

ObjectReference Property PlanterContainer auto hidden
ObjectReference property objSelf auto hidden

Bool Property AlreadyLoaded = FALSE Auto Hidden
int property clearPlanterChoice auto hidden
message property planterClearMessage auto

EVENT OnCellAttach()
	debug.trace(self + " OnCellAttach")
	if AlreadyLoaded == FALSE
		debug.trace(self + " OnCellAttach: DO ONCE")
		objSelf = self
		PlanterContainer = GetLinkedRef()
		(PlanterContainer as BYOHPlanterContainerScript).mySoilRef = objSelf
		AlreadyLoaded = TRUE
	endif
	(PlanterContainer as BYOHPlanterContainerScript).GrowPlantedItem()
endEVENT

auto state empty
	EVENT OnActivate(ObjectReference TriggerRef)
		debug.trace(self + " OnActivate")
		; temp
		actor containerActor = PlanterContainer as actor
		if containerActor
			debug.trace(self + " ShowGiftMenu using filter = " + flPlanterPlantableItem)
			containerActor.ShowGiftMenu(abGivingGift = true, apFilterList = flPlanterPlantableItem, abShowStolenItems = true, abUseFavorPoints = false)
		else
			PlanterContainer.Activate(Game.GetPlayer(), FALSE)
		endif

	endEVENT	
endState


state planted
	EVENT OnActivate(ObjectReference TriggerRef)
		IF triggerRef == game.getPlayer()
			clearPlanterChoice = planterClearMessage.show()
			if clearPlanterChoice == 1
				(PlanterContainer as BYOHPlanterContainerScript).plantedFloraRef.delete()
				(PlanterContainer as BYOHPlanterContainerScript).plantedFloraRef = none
				(PlanterContainer as BYOHPlanterContainerScript).plantedFloraBase = none
				; back to "unplanted" state
				playAnimation("PlayAnim01")
				self.goToState("empty")
				PlanterContainer.Activate(Game.GetPlayer(), FALSE)
			endif
		endIf
	endEVENT	

endState


FormList Property flPlanterPlantableItem auto
