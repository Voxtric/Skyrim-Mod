Scriptname DLC2SV01ClawPickupScript extends ReferenceAlias  
{This script sets a stage if the player picks up either of the two half-claw items when one of them is already in the player's inv}

MiscObject Property DLC2ToldarsTombHalfClaw01  Auto  
MiscObject Property DLC2ToldarsTombHalfClaw02  Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

;	 if (Game.GetPlayer().GetItemCount(DLC2ToldarsTombHalfClaw01) > 0) || (Game.GetPlayer().GetItemCount(DLC2ToldarsTombHalfClaw02) > 0)
;		GetOwningQuest().SetStage(40)
;		endif	
;	  endIf


	ObjectReference PlayerRef = Game.GetPlayer()

 	 if akNewContainer == PlayerRef 
		if (GetReference().GetBaseObject() as  MiscObject) == DLC2ToldarsTombHalfClaw01 
			if PlayerRef.GetItemCount(DLC2ToldarsTombHalfClaw02) >= 1
				GetOwningQuest().setStage(40)	
			endif

		elseif (GetReference().GetBaseObject() as  MiscObject) == DLC2ToldarsTombHalfClaw02  
			if PlayerRef.GetItemCount(DLC2ToldarsTombHalfClaw01) >= 1
				GetOwningQuest().setStage(40)
			endif

		endif

	endif

endEvent
