Scriptname DLC1HarkonCombatMeleeLevelingScript extends Actor

Int Property Stage1 = 20 Auto  
Int Property Stage2 = 28 Auto  
Int Property Stage3 = 38 Auto  
Int Property Stage4 = 48 Auto  
Int Property Stage5 = 99 Auto  

Perk Property Necromancy  Auto  
Perk Property SavageStrike  Auto  
Perk Property MagicResistance30  Auto  
Perk Property MagicResistance50  Auto  
Perk Property HackAndSlash60  Auto  
Perk Property HackAndSlash90  Auto  
Perk Property Bladesman60  Auto  
Perk Property Bladesman90  Auto  
Perk Property WindWalker  Auto  
Perk Property DarkSouls  Auto  
Perk Property AugmentedFrost  Auto  
Perk Property MageArmor30  Auto  
Perk Property MageArmor50  Auto

Race property DLC1VampireLordRace auto
Armor property DLC1VampireLordRoyalArmor auto
Armor property DLC1VampireLordCape auto
Spell property DLC1AbVampireFloatBodyFX auto
Spell property DLC1AbHarkonFloatBodyFX Auto

Function InitializeHarkon()
	SetRace(DLC1VampireLordRace)
	;DrawWeapon()
EndFunction

Event OnCellLoad()
	if (GetRace() != DLC1VampireLordRace)
		SetRace(DLC1VampireLordRace)
	EndIf
	;DrawWeapon()
	AddSpell(DLC1AbHarkonFloatBodyFX)
	if (GetLevel() >= Stage4)
		AddPerk( Necromancy )
		AddPerk( MagicResistance50 ) 	
		AddPerk (SavageStrike )
		AddPerk( HackAndSlash90 )
		AddPerk( Bladesman90 )
		AddPerk( WindWalker )
		AddPerk( DarkSouls )
		AddPerk( AugmentedFrost )
		AddPerk( MageArmor50 )
	ElseIf (GetLevel() >= Stage3)
		AddPerk( Necromancy )
		AddPerk( MageArmor30 )
		AddPerk (SavageStrike )
		AddPerk( MagicResistance30 )
		AddPerk( HackAndSlash60 )
		AddPerk( Bladesman60 )
		AddPerk( WindWalker )
		AddPerk( DarkSouls )
		AddPerk( AugmentedFrost )
		AddPerk( MageArmor50 )
	ElseIf (GetLevel() >= Stage2)
		AddPerk( Necromancy )
		AddPerk( MageArmor30 )
		AddPerk (SavageStrike )
		AddPerk( MagicResistance30 )
	ElseIf (GetLevel() >= Stage1)
		AddPerk( Necromancy )
		AddPerk( MageArmor30 )
	EndIf
EndEvent