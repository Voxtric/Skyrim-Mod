Scriptname DLC1VCMoondialTileScript extends objectReference
{This script controls the tiles placed around the moondial and talks to the DLC1VCMoondialScript}

import game
import debug
import utility

bool property TilePlaced = false auto hidden
{set to true to start open}

MiscObject property Tile auto
{sets what object we are looking for on the player}

ObjectReference property DLC1VCMoondial auto
{Moondial object, this will be cast as DLC1VCMoondialScript}

DLC1VCMoondialScript property MoondialScript auto hidden
{property to talk to the main controller script}

Quest property DLC1VQ04 auto
{quest that needs to be running for activation prompt to appear}

int property TileNumber = 1 auto
{sets which Tile this is, used to talk to the controller script}

Message property DLC1VCMoondialNoTileMessage auto
{Message to display if the player activates this object and does not have the tile}


Event OnCellAttach()
	if !DLC1VQ04.isRunning() || TilePlaced
	;If the quest is not running and/or the tile has been placed
	;		"destroy" object to remove activation prompt
		self.setDestroyed(True)
	elseif DLC1VQ04.isRunning() && !TilePlaced
	;If the quest is not running and the tile has NOT been placed
	;		"un-destroy" object to allow activation prompt
		self.setDestroyed(False)
	endif
endEvent


auto State Waiting
	Event onActivate(objectReference ActivateRef)
		if (ActivateRef as Actor).getItemCount(Tile) > 0
			PlaceTile()
			(ActivateRef as Actor).removeItem(Tile, 1)
		else
			DLC1VCMoondialNoTileMessage.Show()
		endif
	endEvent
endState

State Busy

endState

function PlaceTile()
	; if busy, wait to finish
	self.setDestroyed(True)
	gotoState ("busy")
	trace(self + " Opening")
	playAnimationandWait("Trigger", "Done") ; Animate Open
	MoondialScript = DLC1VCMoondial as DLC1VCMoondialScript
	MoondialScript.SetTilePlaced(TileNumber)
	gotoState("done")
endFunction

State Done
endState

