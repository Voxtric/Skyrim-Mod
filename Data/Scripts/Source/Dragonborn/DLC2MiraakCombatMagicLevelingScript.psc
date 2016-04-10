Scriptname DLC2MiraakCombatMagicLevelingScript extends ReferenceAlias

Int Property Stage1 = 37 Auto hidden
Int Property Stage2 = 44 Auto hidden
Int Property Stage3 = 51 Auto hidden  
Int Property Stage4 = 58 Auto hidden  
Int Property Stage5 = 65 Auto hidden  



Function SetMiraakCombatLevel()
	Actor miraak = GetActorRef()
	;EquipSpell(DLC1dunHarkonConjureGargoyleLeftHand, 0)

	;Other spells (Bats, Mistform, Invisibility, Conjure Gargoyle) are added, force-cast, and/or removed via script
	;on an as-needed basis.
	
	if (miraak.GetLevel() >= Stage4)
		miraak.AddPerk( MageArmor30 )
		miraak.AddPerk( MageArmor50 )
		miraak.AddPerk( MagicResistance30 )
		miraak.AddPerk( MagicResistance50 ) 	
		miraak.AddPerk( Bladesman60 )
		miraak.AddPerk( Bladesman90 )
	ElseIf (miraak.GetLevel() >= Stage3)
		miraak.AddPerk( MageArmor30 )
		miraak.AddPerk( MageArmor50)
		miraak.AddPerk( MagicResistance30 )
		miraak.AddPerk( Bladesman60 )
	ElseIf (miraak.GetLevel() >= Stage2)
		miraak.AddPerk( MageArmor30 )
		miraak.AddPerk( MagicResistance30 )
		miraak.AddPerk( Bladesman60 )
	ElseIf (miraak.GetLevel() >= Stage1)
		miraak.AddPerk( MageArmor30 )
		miraak.AddPerk( MagicResistance30 )
	Else

	EndIf
EndFunction
;/
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
/;

;/
SPELL Property ReanimateCorpseLeftHand  Auto  
SPELL Property RevenantLeftHand  Auto  
SPELL Property RaiseZombieLeftHand  Auto  
SPELL Property crVampireDrain02  Auto  
SPELL Property crVampireDrain03  Auto  
SPELL Property crVampireDrain04  Auto  
SPELL Property crVampireDrain05  Auto  
SPELL Property crVampireDrain06  Auto  
/;
;Perk Property Necromancy  Auto  
;Perk Property SavageStrike  Auto  
Perk Property MagicResistance30  Auto  
Perk Property MagicResistance50  Auto  
;Perk Property HackAndSlash60  Auto  
;Perk Property HackAndSlash90  Auto  
Perk Property Bladesman60  Auto  
Perk Property Bladesman90  Auto  
;Perk Property WindWalker  Auto  
;Perk Property DarkSouls  Auto  
;Perk Property AugmentedFrost  Auto  
Perk Property MageArmor30  Auto  
Perk Property MageArmor50  Auto


;Weapons
Weapon Property DLC2MKMiraakFightSword1 auto
Weapon Property DLC2MKMiraakFightSword2 auto
Weapon Property DLC2MKMiraakFightSword3 auto
Weapon Property DLC2MKMiraakFightSword4 auto
Weapon Property DLC2MKMiraakFightSword5 auto
Weapon Property DLC2MKMiraakFightSword6 auto

Weapon Property DLC2MKMiraakFightStaff1 auto
Weapon Property DLC2MKMiraakFightStaff2 auto
Weapon Property DLC2MKMiraakFightStaff3 auto
Weapon Property DLC2MKMiraakFightStaff4 auto
Weapon Property DLC2MKMiraakFightStaff5 auto
Weapon Property DLC2MKMiraakFightStaff6 auto