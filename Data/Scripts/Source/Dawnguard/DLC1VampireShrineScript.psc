Scriptname DLC1VampireShrineScript extends ObjectReference  

GlobalVariable Property ChosenPower  Auto  

Message Property MessagePrompt  Auto  

int ShrineSelectedPower

Bool[] itemValues

bool IsVampireLord

Event OnInit()
	itemValues = New Bool[10]  ;;IF WE ADD ITEMS NEED TO CHANGE THIS - currently only have 3, giving us some padding because i'm asuming we'll forget to change this if we add some
EndEvent

Event OnActivate(ObjectReference akActor)
	if akActor == Game.GetPlayer() && Game.GetPlayer().HasSpell(DLC1VampireChange) == True
		ShrineSelectedPower = MessagePrompt.Show()
             Debug.Trace(self + "Shrine MessageBox value == " + ShrineSelectedPower)
		if ShrineSelectedPower == -1
			ShrineSelectedPower = 0
		endIf
	endIf
	
	Debug.Trace(self + "OnActivate() MessagePrompt calling SetChosenPower()")
	SetChosenPower()
EndEvent

Function PlayerIsVampireLord(bool IsPlayerVampireLord)	;called by DLC1PlayerVampireChangeScript on DLC1PlayerVampireQuest
	Debug.Trace(self + "PlayerIsVampireLord() setting IsVampireLord to " + IsPlayerVampireLord)
	IsVampireLord = IsPlayerVampireLord

	if IsVampireLord == false
		Debug.Trace(self + "PlayerIsVampireLord() player is not vampire lord, calling SetChosenPower()")
		SetChosenPower()
	endIf

EndFunction

;Need to do this because threaded nature of script system can't guarantee one item's OnUnequip event happens before another's OnEquip
function PlayerEquippedItem(int myValue)
	;because each item has a unique value, we can use the values as the array index
	itemValues[myValue] = true

	Debug.Trace(self + "PlayerEquippedItem([" + myValue + "]) calling SetChosenPower()")
	SetChosenPower()
EndFunction

Function PlayerUnequippedItem(int myValue)
	;because each item has a unique value, we can use the values as the array index
	itemValues[myValue] = false

	Debug.Trace(self + "PlayerUnequippedItem([" + myValue + "]) calling SetChosenPower()")
	SetChosenPower()
EndFunction

Function SetChosenPower()

	if IsVampireLord
		Debug.Trace(self + "SetChosePower() NOT setting power because IsVampireLord == true")
		RETURN
	endIf

	int power

	Debug.Trace(self + "SetChosePower()")

	int index = 0
	int foundValue = -1
	while index < itemValues.length - 1 && foundValue < 0
		if itemValues[index] == true
			foundValue = index
		endIf
		index += 1
	endwhile

	if foundValue >= 0
		Debug.Trace(self + "SetChosePower() itemValues array had a value, so using that value:" + foundValue)
		power = foundValue
		
	else
		Debug.Trace(self + "SetChosePower() itemValues array had no values, so using ShrineSelectedPower:" + ShrineSelectedPower)
		power = ShrineSelectedPower
		
	endIf

	ChosenPower.SetValue(power)
	Debug.Trace(self + "SetChosenPower ChosenPower[" + ChosenPower +"].SetValue(" + power + ")")

	;Debug.MessageBox("VAMPIRE: ChosenPower[" + ChosenPower + "] == " + ChosenPower.Value)

EndFunction



SPELL Property DLC1VampireChange  Auto  
