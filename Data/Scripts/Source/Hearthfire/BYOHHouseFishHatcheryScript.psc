Scriptname BYOHHouseFishHatcheryScript extends ObjectReference  
{script on the fish hatchery activator}

import debug
import utility

Actor Property FishContainer auto hidden;

float fLastSpawnTime					; this is a timestamp of the last time this spawned anything
float Property fSpawnDays = 1.0 auto	; days between spawning

int Property iSpawnCount = 0 auto
{ number of types of fish that have been spawned }

Bool AlreadyLoaded = FALSE

EVENT OnCellAttach()
	FishContainer = GetLinkedRef() as Actor
	SpawnFish()
endEVENT

EVENT OnActivate(ObjectReference TriggerRef)
		debug.trace(self + " OnActivate")
		FishContainer = GetLinkedRef() as Actor
		FishContainer.ShowGiftMenu(abGivingGift = true, apFilterList = BYOHHouseFishContainerList, abShowStolenItems = true, abUseFavorPoints = false)
endEVENT	

; called onCellAttach to see if it's time to spawn new fish
function SpawnFish()
	debug.trace(self + "SpawnFish")
	; see if enough time has passed since last spawn
	if GameDaysPassed.GetValue() >= fLastSpawnTime + fSpawnDays
		; reset spawn time stamp
		fLastSpawnTime = GameDaysPassed.GetValue()
		; run through the fish form list
		iSpawnCount = 0
		int iIndex = 0
		debug.trace(self + "SpawnFish: spawning...")
		while iIndex < BYOHHouseFishContainerList.GetSize()
			; if we have any of this kind of fish in the hatchery container, enable the matching ref
			if FishContainer.GetItemCount(BYOHHouseFishContainerList.GetAt(iIndex)) > 0
				FishReferences[iIndex].Enable()
				; increment spawn count
				iSpawnCount += 1
			else
				FishReferences[iIndex].Disable()
				; decrement spawn count
				iSpawnCount += -1
			endif
			iIndex+=1
		endWhile
	endif

endFunction

FormList Property BYOHHouseFishContainerList auto
ObjectReference[] Property FishReferences auto
GlobalVariable Property GameDaysPassed auto