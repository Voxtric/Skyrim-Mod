Scriptname BYOHHouseCowScript extends ObjectReference  
{script to enable cow when bought}

BYOHHouseScript Property BYOHHouseQuest  Auto  

int Property CowID = 1 Auto
{ which "number" of cow am I? }

int Property MaxMilk = 7 Auto
{ what's the max number of milk to store in kitchen container }

Potion Property BYOHFoodMilk Auto

float lastMilked

GlobalVariable property GameDaysPassed auto

; on load, check cow variable of my house quest to see if I should be enabled
Event OnCellAttach()
	if BYOHHouseQuest.numCows >= CowID
		Enable()
	endif
	if IsEnabled() && !(((self as ObjectReference) as Actor).IsDead())
		; every day, add milk to the linked ref if enabled (kitchen cupboard)
		if GameDaysPassed.GetValue() >= (lastMilked + 1.0)
			int numMilk = (GameDaysPassed.GetValue() - lastMilked) as int
			; reset timestamp
			lastMilked = GameDaysPassed.GetValue()
			; add milk if container is enabled and not full
			ObjectReference milkCupboard = GetLinkedRef()
			if milkCupboard.IsEnabled()
				int MaxToAdd = MaxMilk - milkCupboard.GetItemCount(BYOHFoodMilk)
				if numMilk > maxToAdd
					numMilk = maxToAdd
				endif
				if numMilk > 0				 
					debug.trace(self + " adding " + numMilk + " to " + milkCupboard)
					milkCupboard.AddItem(BYOHFoodMilk, numMilk)
				endif
			endif
		endif
	endif
endEvent

Event OnCellDetach()
	if ((self as ObjectReference) as Actor).IsDead()
		BYOHHouseQuest.HouseAnimalDied(self)
	endif
endEvent