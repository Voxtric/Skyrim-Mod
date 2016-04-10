Scriptname DLC2FFR04QuestScript extends Quest  

Potion Property pDLC2RRF04Sujamma  Auto
GlobalVariable Property pDLC2RRF04DrinkCount Auto

Function RestockSujamma()

	Game.GetPlayer().AddItem(pDLC2RRF04Sujamma,2)

endFunction

Function GiveADrink()

	Game.GetPlayer().RemoveItem(pDLC2RRF04Sujamma,1)
	ModObjectiveGlobal(1, pDLC2RRF04DrinkCount, 10)

	if pDLC2RRF04DrinkCount.GetValue() >= 10
		SetStage(30)
	endif

endFunction 