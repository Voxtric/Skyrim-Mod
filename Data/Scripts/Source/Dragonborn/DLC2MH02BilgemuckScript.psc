Scriptname DLC2MH02BilgemuckScript extends ReferenceAlias  


FormList Property MEAT auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
; 	Debug.Trace("DLC2MH02: Adding item to Bilgemuck.")
	if (GetOwningQuest().GetStage() != 10)
		return
	endif
; 	Debug.Trace("DLC2MH02: Adding item to Bilgemuck.")
	if (akSourceContainer == Game.GetPlayer() && MEAT.Find(akBaseItem) >= 0)
		GetOwningQuest().SetStage(15)
	else
; 		Debug.Trace("DLC2MH02: Gave Bilgemuck something that wasn't meat.")
	endif
EndEvent

Event OnDeath(Actor akKiller)
	if (GetOwningQuest().GetStage() < 30)
		GetOwningQuest().SetStage(210)
	endif
EndEvent