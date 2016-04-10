ScriptName DLC2dunKarstaagResetTriggerScript extends ObjectReference
{Script to force-reset the Karstaag battle if the player bails. Used on triggers outside the courtyard exits.}

ObjectReference property KarstaagBattleTrigger Auto

Event OnTriggerEnter(ObjectReference triggerRef)
	if ((triggerRef == Game.GetPlayer()) && !KarstaagBattleTrigger.IsDisabled())
		(KarstaagBattleTrigger as DLC2dunKarstaagBattleTriggerScript).ResetBattle()
	EndIf
EndEvent