Scriptname DLC2RRFavor05QuestScript extends Quest  Conditional

Armor Property pDLC2RRF05EECNecklace Auto
MiscObject Property pGold001 Auto
int Property pSellPrice Auto

Function SellPendant()

	int CurrentCount = Game.GetPlayer().GetItemCount(pDLC2RRF05EECNecklace)
	int Payout = CurrentCount * pSellPrice

	Game.GetPlayer().RemoveItem(pDLC2RRF05EECNecklace,CurrentCount)
	Game.GetPlayer().AddItem(pGold001,Payout)

endFunction