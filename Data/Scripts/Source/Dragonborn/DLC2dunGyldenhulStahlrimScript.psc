ScriptName DLC2dunGyldenhulStahlrimScript extends ObjectReference
{Script for the special destructible Stahlrim in Gyldenhul Barrow.}

MusicType property myMusic auto
{Music to play when player breaks the Stahlrim}

Keyword property LinkCustom02 Auto

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
; 	Debug.Trace("Event Received")
	;When the Stahlrim changes state, play music...
	myMusic.Add()
	;..and disable the blackplanes.
	Self.GetLinkedRef(LinkCustom02).Disable()
EndEvent