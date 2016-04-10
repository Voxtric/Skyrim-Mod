Scriptname DLC1VQ04IngredientAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ04  Auto  
ReferenceAlias Property pIngredientReference  Auto  
int Property pObjective Auto
ObjectReference Property pBowlFull Auto
ObjectReference Property pBowlEmpty Auto
GlobalVariable Property pFoundGlobal Auto
DLC1VQ04QuestScript Property pDLC1VQ04QS Auto
GlobalVariable Property pDLC1VQ04Ingredient Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pFoundGlobal.GetValue() == 0
			pBowlFull.Disable()
			pDLC1VQ04Ingredient.SetValue(pDLC1VQ04Ingredient.GetValue() + 1)
			Game.GetPlayer().AddItem(pIngredientReference.GetRef())
			if pDLC1VQ04.IsObjectiveDisplayed(pObjective) == 1
				pDLC1VQ04.SetObjectiveCompleted(pObjective,1)
			endif
			pDLC1VQ04QS.CheckIngreds()
			pFoundGlobal.SetValue(1)
		endif
	endif

endEvent