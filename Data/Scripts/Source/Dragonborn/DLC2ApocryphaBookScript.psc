Scriptname DLC2ApocryphaBookScript extends ObjectReference  
{Base script for the 'Black Books' at the end of each Apocrypha dungeon. Must be linked to matching books in Tamriel to work. Usually extended by DLC2ApocryphaBookRewardScript.}

;--------------------------------------------------
;APOCRYPHA MANAGEMENT PROPERTIES
;-------------------------------

Quest Property DLC2BookDungeonController Auto
{Reference to the Dungeon Controller script, which handles direct player activations of the Reward Book.}

Quest Property myQuest  Auto  
{Optional: Quest to set stage on when read.}

Int Property myQuestStage  Auto  
{Optional: Quest stage to set when read.}

bool Property requireQuestStageToMove = False Auto
{If True, the book won't move you back to Tamriel until the specified quest stage is set.}

Keyword property LinkCustom04 Auto
{Link to the corresponding book activator.}

Keyword property LinkCustom05 Auto
{Link to the corresponding portal activator.}

Keyword property LinkCustom06 Auto
{Link to the corresponding blank (collision only) activator.}


;--------------------------------------------------
;STATES & EVENTS
;---------------

Event OnInit()
	;Disable follower activation, just in case.
	Self.SetNoFavorAllowed(True)
EndEvent

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			GoToState("Busy")
			(DLC2BookDungeonController as DLC2BookDungeonControllerScript).ReadApocryphaBook(Self, requireQuestStageToMove)
			GoToState("Waiting")
		EndIf
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState

Function DisableBothActivators()
	Self.GetLinkedRef(LinkCustom06).Enable()
	Self.GetLinkedRef(LinkCustom04).Disable()
	Self.GetLinkedRef(LinkCustom05).Disable()
EndFunction

Function EnableToSolstheimActivator()
	Self.GetLinkedRef(LinkCustom05).Enable()
	Self.GetLinkedRef(LinkCustom04).Disable()
	Self.GetLinkedRef(LinkCustom06).Disable()
EndFunction

Function EnableBookActivator()
	DisableToSolstheimActivator()
EndFunction

Function DisableToSolstheimActivator()
	Self.GetLinkedRef(LinkCustom04).Enable()
	Self.GetLinkedRef(LinkCustom05).Disable()
	Self.GetLinkedRef(LinkCustom06).Disable()
EndFunction
