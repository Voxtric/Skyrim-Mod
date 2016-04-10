Scriptname DLC2TTR8Script extends Quest  

Event OnInit()
	DLC2TTR8Ingredient.SetValue(utility.RandomInt(1, 6))
EndEvent

GlobalVariable Property DLC2TTR8Ingredient  Auto  
