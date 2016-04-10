Scriptname DLC01SoulHorseEncounter extends ObjectReference  
{Extends ObjectReference, used to cause the Soul Cairn Horse to appear, run to a point, then dissappear}
import Debug
import Utility

;This trigger is used in conjunction with the quest DLC01SoulCairnHorseQuest to cause a series of repeatable events
;The script forces the Trigger and two linked XMarkers into aliases in the quest, then moves the Horse to the first xmarker
;The horse should then run to the next one.
;In addition, this script should be make this a repeatable event.  Once the player hits the trigger, the trigger should disable until it has unloaded, then loaded again.

ObjectReference Property Horse auto

ReferenceAlias Property HorseTrigger auto
ReferenceAlias Property HorseStart auto
ReferenceAlias Property HorseEnd auto

Keyword Property HorseStartKeyword auto
Keyword Property HorseEndKeyword auto

Bool Property HorseActivate auto

Quest Property DLC01SoulCairnHorseQuest2 auto
int HorseStage = 200

;VFX for the teleport process.
Activator property SummonFX Auto

Event OnCellAttach()
	HorseActivate = 1
EndEvent

Event OnTriggerEnter(ObjectReference akActivator)
		;Notification("Script Start")
	if (DLC01SoulCairnHorseQuest2.isStageDone(HorseStage) == FALSE)
		if ((akActivator == game.getPlayer() as Actor) && (HorseActivate==1))
			HorseActivate=0
			HorseTrigger.ForceRefto(self)
			HorseStart.ForceRefTo(GetLinkedRef(HorseStartKeyword))
			HorseEnd.ForceRefTo(GetLinkedRef(HorseEndKeyword))
			Horse.MoveTo(GetLinkedRef(HorseStartKeyword))
			Horse.enable(TRUE)
			GetLinkedRef(HorseStartKeyword).PlaceAtMe(SummonFX)
			Horse.MoveTo(GetLinkedRef(HorseStartKeyword))
		endif
	else
		self.disable()
	endif
EndEvent

