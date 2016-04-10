Scriptname DLC1AurielsBowPlayerScript extends ActiveMagicEffect  

Spell Property DLC1AurielsBowSunAttackSpell Auto
Spell Property DLC1AurielsBowEclipseSpell Auto

ImageSpaceModifier property LightImodFX auto
{Light spell iMod for spell}
ImageSpaceModifier property DarkImodFX auto
{Dark spell iMod for spell}

Actor Subject
Bool bCorrectBowEquipped = False
ImageSpaceModifier MyImageSpace = None

Event OnObjectEquipped(Form akWeapon, ObjectReference akWeaponRef)
	if akWeapon == DLC1AurielsBow
		registerForAnimationEvent(Game.GetPlayer(), "arrowRelease")
		bCorrectBowEquipped = True
	endIf

	if akWeapon == DLC1ElvenArrowBlood
		BloodArrowEquipped = True
	endif
	if akWeapon == DLC1ElvenArrowBlessed
		BlessedArrowEquipped = True
	endif
	
	GetSunGazeImod()
	;Debug.Trace("If we look at the sun, the Imod will be " + MyImageSpace)
	;Debug.Trace("This is because bCorrectBowEquipped = " + bCorrectBowEquipped + " BloodArrowEquipped = " + BloodArrowEquipped + " and BlessedArrowEquipped = " +BlessedArrowEquipped)
EndEvent

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float akBowDraw, bool abSunGazing)
	Debug.Trace("AURIEL'S BOW: OnPlayerBowShot")
	if akWeapon == DLC1AurielsBow && DLC1EclipseActive.Value == 0
		if abSunGazing == True
			Debug.Trace("AURIEL's BOW: Player is sungazing")
			if akBowDraw >= 0.95
				Debug.Trace("AURIEL'S BOW: Draw is " + akBowDraw)
				if BloodArrowEquipped
					if DLC1EclipseActive.GetValue() == 0.0
						Game.AddAchievement(56)
						Subject = self.GetTargetActor()
						DLC1AurielsBowEclipseSpell.Cast(Subject,Subject)
						RegisterForSingleUpdateGameTime(20 - GameHour.Value)
						DLC1EclipseActive.Value = 1.0
					endif
				elseif BlessedArrowEquipped
					Game.AddAchievement(56)
					Subject = self.GetTargetActor()
					DLC1AurielsBowSunAttackSpell.Cast(Subject,Subject)
				endif
			endIf
		endIf
	endIf

EndEvent

Event OnUpdateGameTime()
	DLC1EclipseActive.Value = 0
	Subject.DispelSpell(DLC1AurielsBowEclipseSpell)
EndEvent

Event OnObjectUnequipped(Form akWeapon, ObjectReference akWeaponRef)
	if akWeapon == DLC1AurielsBow
		UnregisterForAnimationEvent(Game.GetPlayer(), "arrowRelease")
		bCorrectBowEquipped = False
	endIf
	if akWeapon == DLC1ElvenArrowBlood
		BloodArrowEquipped = False
	endif
	if akWeapon == DLC1ElvenArrowBlessed
		BlessedArrowEquipped = False
	endif
	
	GetSunGazeImod()
EndEvent


;Function for setting the correct Imod
ImageSpaceModifier Function GetSunGazeImod()

	If bCorrectBowEquipped
		if BloodArrowEquipped
			;Debug.Trace("Imod is Dark!")
			MyImageSpace = DarkImodFX
		ElseIf BlessedArrowEquipped
			;Debug.Trace("Imod is Light!")
			MyImageSpace = LightImodFX
		Else
			;Debug.Trace("Imod is None!")
			MyImageSpace = None
		EndIf
	Else
		MyImageSpace = None
	endif
	Game.SetSunGazeImageSpaceModifier(MyImageSpace)
	
EndFunction

WEAPON Property DLC1AurielsBow  Auto  

Ammo Property DLC1ElvenArrowBlood  Auto  
Ammo Property DLC1ElvenArrowBlessed  Auto  

Bool Property BloodArrowEquipped  Auto  
Bool Property BlessedArrowEquipped  Auto  



GlobalVariable Property DLC1EclipseActive  Auto  

GlobalVariable Property GameHour  Auto  

;GlobalVariable Property DLC1AurielLastArrowFiredByPlayer Auto
{0 = Plain Bow any arrow, 1 = Auriel's and SunArrow, 2 = Auriel's and Not SunArrow}  

FormList Property SunAffectingWorldspaces  Auto  
