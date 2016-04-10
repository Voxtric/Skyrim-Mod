scriptName DLC1VQ04BloodbowlScript extends ObjectReference
{This script handles adding the special ingredients to the bowl for VQ04 and talks to the quest}


Quest Property DLC1VQ04 auto
int Property Stage auto
miscObject Property DLC1VQ04IngredBoneMeal auto
miscObject Property DLC1VQ04IngredVoidSalt auto
miscObject Property DLC1VQ04IngredSoulGemShard auto

bool Property BoneMealPlaced auto hidden
bool Property VoidSaltsPlaced auto hidden
bool Property SoulGemsPlaced auto hidden

objectReference Property DLC1VQ04BloodBowlFurniture auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Event block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

auto state waiting
	event onActivate(objectReference activateRef)

	if DLC1VQ04.GetStage() == 70
		if activateRef == game.getPlayer()
			goToState("Busy")
			ProcessIngredients()
		endif
	endif

	endEvent
endState

State Busy
endState


Function ProcessIngredients()
	
	if !BoneMealPlaced && game.getPlayer().getItemCount(DLC1VQ04IngredBoneMeal) > 0
		BoneMealPlaced = True
		game.getPlayer().removeItem(DLC1VQ04IngredBoneMeal, 1)
		DLC1VQ04BloodBowlFurniture.PlayAnimationAndWait("Trigger01","Done")
	endif
	if !VoidSaltsPlaced && game.getPlayer().getItemCount(DLC1VQ04IngredVoidSalt) > 0
		VoidSaltsPlaced = True
		game.getPlayer().removeItem(DLC1VQ04IngredVoidSalt, 1)
		DLC1VQ04BloodBowlFurniture.PlayAnimationAndWait("Trigger02","Done")
	endif
	if !SoulGemsPlaced && game.getPlayer().getItemCount(DLC1VQ04IngredSoulGemShard) > 0
		SoulGemsPlaced = True
		game.getPlayer().removeItem(DLC1VQ04IngredSoulGemShard, 1)
		DLC1VQ04BloodBowlFurniture.PlayAnimationAndWait("Trigger03","Done")
	endif
	if BoneMealPlaced && VoidSaltsPlaced && SoulGemsPlaced
		DLC1VQ04.SetStage(Stage)
		self.Disable()
	endif
	goToState("waiting")

endFunction
	
	
