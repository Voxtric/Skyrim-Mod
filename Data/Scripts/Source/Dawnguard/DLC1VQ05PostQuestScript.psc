Scriptname DLC1VQ05PostQuestScript extends Quest  Conditional

Potion Property pDLC1FoodSoulHusk  Auto  
Potion Property pDLC1FoodSoulHuskExtract  Auto
ReferenceAlias Property pDLC1VQ05PostValericaAlias Auto
ObjectReference Property pDLC1ValericaPQSandbox Auto
DLC1VampireCastleControllerScript Property pCastleController Auto

Function HuskSwap()

	Game.GetPlayer().RemoveItem(pDLC1FoodSoulHusk,5)
	Game.GetPlayer().AddItem(pDLC1FoodSoulHuskExtract,1)

endFunction

Function ValericaGoHome()

	pDLC1VQ05PostValericaAlias.GetActorRef().MoveTo(pDLC1ValericaPQSandbox)
	pDLC1VQ05PostValericaAlias.GetActorRef().EvaluatePackage()
	pCastleController.EnableValericasRoom()
	pCastleController.EnableValericasGarden()

endFunction
