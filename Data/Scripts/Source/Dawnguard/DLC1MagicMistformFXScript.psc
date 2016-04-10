Scriptname DLC1MagicMistformFXScript extends ActiveMagicEffect  
{This script holds additional effects for the Mistform Power.}

GlobalVariable Property DLC1VampireLevitateStateGlobal Auto
spell Property DLC1VampireMistform auto
Message Property DLC1MistformWaitMessage auto


float fLevStateStartValue = 0.0

Event OnEffectStart(Actor akTarget, Actor akCaster)
	fLevStateStartValue = DLC1VampireLevitateStateGlobal.GetValue()
	DLC1VampireLevitateStateGlobal.setvalue(4.0)  ; We set this to 4.0 only here, so we can tell later if the state is unchanged.

	; Make player turn invisible and throw away attached arrows.
	akCaster.SetSubGraphFloatVariable("fdampRate", 0.015) ;;speeds up fade rate (max 1 min .1
	akCaster.SetSubGraphFloatVariable("ftoggleBlend", 1.45) ;;blends between two anims default 0 (0 = there 1 = gone)
	akCaster.ClearExtraArrows()

	if akCaster == Game.GetPlayer()
		; disable fighting and activating
		Game.DisablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = true, abMenu = true, abActivate = true)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	DLC1MistformWaitMessage.Show()
	akCaster.DispelSpell(DLC1VampireMistform)

	if DLC1VampireLevitateStateGlobal.GetValue() == 4.0
		DLC1VampireLevitateStateGlobal.setvalue(fLevStateStartValue)
	endif
	
	akCaster.SetSubGraphFloatVariable("fdampRate", 0.02) ;;speeds up fade rate (max 1 min .1
	akCaster.SetSubGraphFloatVariable("ftoggleBlend", -0.05);;blends between two anims default 0 (0 = there 1 = gone)
	if akCaster == Game.GetPlayer()
		; duplicate of what the DLC1PlayerVampireQuest script runs in Prepshift
		Game.EnablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abMenu = true, abActivate = true)
	endif

EndEvent


