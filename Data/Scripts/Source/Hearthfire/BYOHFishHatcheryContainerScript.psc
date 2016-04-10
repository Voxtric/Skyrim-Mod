Scriptname BYOHFishHatcheryContainerScript extends ObjectReference  


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	int iTotalItemCount = GetItemCount(akBaseItem)
	debug.trace(self + "iTotalItemCount = " + iTotalItemCount)
	; if more than 1 in the container, give them back to the player
	if iTotalItemCount > 1
		self.RemoveItem(akBaseItem, (iTotalItemCount - 1), true, Game.GetPlayer())
		utility.WaitMenuMode(0)
		BYOHFishHatcheryOnlyOneItemMESSAGE.Show()
	else
		BYOHFishHatcherySuccessMESSAGE.Show()
	endif
endevent

message property BYOHFishHatcheryOnlyOneItemMESSAGE auto
message property BYOHFishHatcherySuccessMESSAGE auto


