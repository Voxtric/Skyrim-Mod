Scriptname DLC1SCHMQuestScript extends Quest  Conditional

LeveledItem Property pLItemEnchWeaponBowSpecial  Auto  
LeveledItem Property pLItemEnchWeaponSwordSpecial  Auto  
LeveledItem Property pLItemEnchWeaponBattleAxeSpecial  Auto  
LeveledItem Property pLItemEnchArmorLightAllSpecial  Auto  
LeveledItem Property pLItemEnchArmorHeavyAllSpecial  Auto  
LeveledItem Property pLItemSpellTomesSpecial  Auto  
Potion Property pDLC1FoodSoulHusk  Auto  
GlobalVariable Property pDLC1SCMerch  Auto  

Function SellHusks()
	Debug.Trace("pDLC1SCMerch: " + pDLC1SCMerch)
	if pDLC1SCMerch.GetValue() > 0
		if pDLC1SCMerch.GetValue() == 1
			Game.GetPlayer().RemoveItem(pDLC1FoodSoulHusk,25)
			Game.GetPlayer().AddItem(pLItemEnchWeaponSwordSpecial,1)
			pDLC1SCMerch.SetValue(0)
		elseif pDLC1SCMerch.GetValue() == 2
			Game.GetPlayer().RemoveItem(pDLC1FoodSoulHusk,25)
			Game.GetPlayer().AddItem(pLItemEnchWeaponBattleAxeSpecial,1)
			pDLC1SCMerch.SetValue(0)
		elseif pDLC1SCMerch.GetValue() == 3
			Debug.Trace("Tried to add a bow")
			Game.GetPlayer().RemoveItem(pDLC1FoodSoulHusk,25)
			Game.GetPlayer().AddItem(pLItemEnchWeaponBowSpecial,1)
			pDLC1SCMerch.SetValue(0)
		elseif pDLC1SCMerch.GetValue() == 4
			Game.GetPlayer().RemoveItem(pDLC1FoodSoulHusk,25)
			Game.GetPlayer().AddItem(pLItemEnchArmorLightAllSpecial,1)
			pDLC1SCMerch.SetValue(0)
		elseif pDLC1SCMerch.GetValue() == 5
			Game.GetPlayer().RemoveItem(pDLC1FoodSoulHusk,25)
			Game.GetPlayer().AddItem(pLItemEnchArmorHeavyAllSpecial,1)
			pDLC1SCMerch.SetValue(0)
		elseif pDLC1SCMerch.GetValue() == 6
			Game.GetPlayer().RemoveItem(pDLC1FoodSoulHusk,25)
			Game.GetPlayer().AddItem(pLItemSpellTomesSpecial,1)
			pDLC1SCMerch.SetValue(0)
		endif
	endif
	
endFunction