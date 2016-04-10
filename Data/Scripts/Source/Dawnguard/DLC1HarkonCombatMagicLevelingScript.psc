Scriptname DLC1HarkonCombatMagicLevelingScript extends Actor

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
Spell property DLC1DunHarkoncrVampireDrain02 auto
Spell property DLC1DunHarkoncrVampireDrain03 auto
Spell property DLC1DunHarkoncrVampireDrain04 auto
Spell property DLC1DunHarkoncrVampireDrain05 auto
Spell property DLC1DunHarkoncrVampireDrain06 auto
Spell property DLC1DunHarkoncrVampireDrain07 auto
Spell property DLC1AbHarkonFloatBodyFX Auto
Spell property DLC1HarkonDrain02AltNew Auto
Spell property DLC1HarkonDrain03AltNew Auto
Spell property DLC1HarkonDrain04AltNew Auto
Spell property DLC1HarkonDrain05AltNew Auto
Spell property DLC1HarkonDrain06AltNew Auto
Spell property DLC1dunHarkonConjureGargoyleLeftHand Auto

bool initializeSpellSelections

Function InitializeHarkon()
	SetRace(DLC1VampireLordRace)
	StartSneaking()
	;DrawWeapon()
EndFunction

Event OnCellLoad()
	if (GetRace() != DLC1VampireLordRace)
		SetRace(DLC1VampireLordRace)
	EndIf
	StartSneaking()
	;DrawWeapon()
	AddSpell(DLC1AbHarkonFloatBodyFX)
	
	AddSpell( RevenantLeftHand )
	AddSpell( ReanimateCorpseLeftHand )
	AddSpell( RaiseZombieLeftHand )
	
	AddSpell(DLC1dunHarkonConjureGargoyleLeftHand)
	;EquipSpell(DLC1dunHarkonConjureGargoyleLeftHand, 0)

	;Other spells (Bats, Mistform, Invisibility, Conjure Gargoyle) are added, force-cast, and/or removed via script
	;on an as-needed basis.
	
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
		AddSpell(DLC1DunHarkoncrVampireDrain06)
		AddSpell(DLC1HarkonDrain06AltNew)
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
		AddPerk( MageArmor50)
		AddSpell(DLC1DunHarkoncrVampireDrain05)
		AddSpell(DLC1HarkonDrain05AltNew)
	ElseIf (GetLevel() >= Stage2)
		AddPerk( Necromancy )
		AddPerk( MageArmor30 )
		AddPerk (SavageStrike )
		AddPerk( MagicResistance30 )
		AddSpell(DLC1DunHarkoncrVampireDrain04)
		AddSpell(DLC1HarkonDrain04AltNew)
	ElseIf (GetLevel() >= Stage1)
		AddPerk( Necromancy )
		AddPerk( MageArmor30 )
		AddSpell(DLC1DunHarkoncrVampireDrain03)
		AddSpell(DLC1HarkonDrain03AltNew)
	Else
		AddSpell(DLC1DunHarkoncrVampireDrain02)
		AddSpell(DLC1HarkonDrain02AltNew)
	EndIf
EndEvent

Function ReequipDrainSpell()
	if (GetLevel() >= Stage4)
		EquipSpell(DLC1DunHarkoncrVampireDrain06, 0)
		EquipSpell(DLC1HarkonDrain06AltNew, 0)
	ElseIf (GetLevel() >= Stage3)
		EquipSpell(DLC1DunHarkoncrVampireDrain05, 0)
		EquipSpell(DLC1HarkonDrain05AltNew, 0)
	ElseIf (GetLevel() >= Stage2)
		EquipSpell(DLC1DunHarkoncrVampireDrain04, 0)
		EquipSpell(DLC1HarkonDrain04AltNew, 0)
	ElseIf (GetLevel() >= Stage1)
		EquipSpell(DLC1DunHarkoncrVampireDrain03, 0)
		EquipSpell(DLC1HarkonDrain03AltNew, 0)
	Else
		EquipSpell(DLC1DunHarkoncrVampireDrain02, 0)
		EquipSpell(DLC1HarkonDrain02AltNew, 0)
	EndIf
EndFunction



SPELL Property ReanimateCorpseLeftHand  Auto  
SPELL Property RevenantLeftHand  Auto  
SPELL Property RaiseZombieLeftHand  Auto  
SPELL Property crVampireDrain02  Auto  
SPELL Property crVampireDrain03  Auto  
SPELL Property crVampireDrain04  Auto  
SPELL Property crVampireDrain05  Auto  
SPELL Property crVampireDrain06  Auto  