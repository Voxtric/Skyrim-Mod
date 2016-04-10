Scriptname BYOHHouseBardScript extends Actor  

String Property sInstrument = "Lute" Auto  
{current instrument to play instrumental music
defaults to Lute}

int Property iPlayOnLoadPercent = 50 Auto
{ percent chance that bard will be playing when you enter the house
 default = 50
}

int Property iPlayOnLoadStartHour = 10 Auto
{ earliest time to start playing onload }

int Property iPlayOnLoadEndHour = 22 Auto
{ latest time to start playing onload }

GlobalVariable Property GameHour Auto

BardSongsScript Property BardSongs  Auto  

BYOHHouseScript Property houseQuest Auto
{ my owning quest }

event OnCellAttach()
	if houseQuest.bBoughtBard
		if !IsEnabled()
			; move back to my editor location and enable
			MoveToMyEditorLocation()
			Enable()
		else

			; if I'm in the house, and between the right hours, play music
			if GameHour.GetValueInt() >= iPlayOnLoadStartHour && GameHour.GetValueInt() <= iPlayOnLoadEndHour && GetEditorLocation() == GetCurrentLocation()
				debug.trace(self + " OnLoad: play music")
				; instrumental or sung?
				if Utility.RandomInt(1, 2) == 1
					debug.trace(self + " OnLoad: instrumental")
					BardSongs.PlaySong(self, sInstrument, true )
				else
					debug.trace(self + " OnLoad: vocal")
					BardSongs.PlaySongRequest(self, "Any", true, BardSongs.GetRandomSong(self))
				endif
			else
				if GetEditorLocation() == GetCurrentLocation()
					BardSongs.StopAllSongs()
				endif
			endif

		endif
	endif
endEvent

event OnUnload()
	if houseQuest.bBoughtBard == false
		Disable()
	endif
endEvent

