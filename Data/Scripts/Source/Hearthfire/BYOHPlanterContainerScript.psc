Scriptname BYOHPlanterContainerScript extends ObjectReference  

formlist property flPlanterPlantableItem auto	;formlist of plantable items
formlist property flPlanterPlantedFlora auto	;formlist of planted flora

form property plantedItem auto hidden
form property plantedItemRef auto hidden
form property plantedFloraBase auto hidden
objectReference property plantedFloraRef auto hidden
objectReference property mySoilRef auto hidden

int property plantedItemIndex auto hidden

message property PlanterNotPlantableMESSAGE auto
message property PlanterOnlyOneItemMESSAGE auto
message property PlanterPreviousItemRemovedMESSAGE auto
bool property containerProccessed = false auto hidden

GlobalVariable property GameDaysPassed auto
float plantedTimestamp				; when my item was planted
float resetTimestamp				; last time my planted flora was reset - this is needed because placed objects do not reset with their cell
float property growDays = 1.0 auto
{ number of days it takes to grow after being planted }
float property resetDays = 3.0 auto
{ number of days between resetting the flora }

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

endEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	;Trace("PLANTER - Adding " + akBaseItem + " to the Planter Container")
	debug.Trace(self + " has had " + akBaseItem + " added to inventory: Checking Type")
	
	;If items is potion or ingredient && item is in our formlist
	if ((akBaseItem as Potion) || (akBaseItem as Ingredient)) && flPlanterPlantableItem.hasForm(akBaseItem as form)	
			debug.Trace(self + " has found " + akBaseItem + " to be in the FormList: setting as planted item")
			
			int flIndex = 0
			while flIndex < flPlanterPlantableItem.getSize()
				if akBaseItem == flPlanterPlantableItem.getAt(flIndex)
					plantedItemIndex = flIndex
					debug.Trace(self + " index=" + plantedItemIndex)
					;we have found the index, set incremental counter to formlist size to force kick out
					flIndex = flPlanterPlantableItem.getSize()
				endif
				flIndex += 1
			endWhile
			
			if plantedItem
				self.RemoveItem(plantedItem, 1, true, Game.GetPlayer())
				plantedItem = akBaseItem
				plantedItemRef = akItemReference
				debug.Trace(self + " has set plantedItem to " + akBaseItem)
				
				utility.WaitMenuMode(0)
				
				PlanterPreviousItemRemovedMESSAGE.Show()
			else
				plantedItem = akBaseItem
				plantedItemRef = akItemReference
			endif
			if plantedItem
				debug.Trace(self + " plantedItem=" + plantedItem)
			endif

			if (aiItemCount > 1)
				self.RemoveItem(akBaseItem, (aiItemCount - 1), true, Game.GetPlayer())
				utility.WaitMenuMode(0)
				PlanterOnlyOneItemMESSAGE.Show()
			else
				PlanterItemPlantedMESSAGE.Show()
			endif
		
		
	else
		self.RemoveItem(akBaseItem, aiItemCount, true, Game.GetPlayer())
		utility.WaitMenuMode(0)
		PlanterNotPlantableMESSAGE.Show()
	endif
	
	
	if !containerProccessed
		debug.Trace(self + " processing container")
		containerProccessed = True
		Utility.wait(0)
		SetPlantedItem()
	endif
endEvent

Event onClose(ObjectReference akActionRef)
	;debug.notification(self + " has been closed by " + akActionRef)
endEvent


Function SetPlantedItem()
	debug.trace(self + " SetPlantedItem: plantedItemIndex=" + plantedItemIndex + ", plantedFloraBase="+plantedFloraBase)
	containerProccessed = False
	if	!plantedFloraBase || plantedFloraBase != flPlanterPlantedFlora.getAt(plantedItemIndex)
		plantedFloraBase = flPlanterPlantedFlora.getAt(plantedItemIndex)
		debug.Trace(self + " plantedFloraBase="+plantedFloraBase)
		; set timestamp
		plantedTimestamp = GameDaysPassed.GetValue()
		; switch soil visual state
		mySoilRef.playAnimation("PlayAnim02")
	endif	
		
endFunction

event onCellAttach()
	GrowPlantedItem()
endEvent

; call this when it's time to try to grow the planted item
function GrowPlantedItem()
	debug.Trace(self + "onCellAttach - check to see if anything should grow " + GameDaysPassed.GetValue() + ", plantedTimestamp=" + plantedTimestamp)
	if !plantedFloraRef && plantedItem && (GameDaysPassed.GetValue() - plantedTimestamp) >= growDays
		debug.Trace(self + " growing " + plantedItem)
		; count this as the "last reset" time
		resetTimestamp = GameDaysPassed.GetValue()
		; remove the planted item from container and place flora
		self.removeItem(plantedItem, 1)
		plantedItem = none
		plantedItemRef = none
		plantedFloraRef = mySoilRef.placeAtMe(plantedFloraBase)
		(mySoilRef as BYOHPlanterSoilScript).goToState("planted")
	elseif plantedFloraRef && (GameDaysPassed.GetValue() - resetTimestamp) >= resetDays
		; if I've already placed a flora, see if it's time to reset
		debug.Trace(self + " resetting " + plantedFloraBase)
		; delete existing ref
		plantedFloraRef.Delete()
		; place a new one
		plantedFloraRef = mySoilRef.placeAtMe(plantedFloraBase)
		(mySoilRef as BYOHPlanterSoilScript).goToState("planted")
		; new reset timestamp
		resetTimestamp = GameDaysPassed.GetValue()
	endif
endFunction

Message Property PlanterItemPlantedMESSAGE  Auto  
