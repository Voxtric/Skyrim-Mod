Scriptname DLC2VoiceBendWillEffectScript extends ActiveMagicEffect  


Event OnEffectStart(actor akTarget, actor akCaster)
	akTarget.SetPlayerTeammate(true, false)
	akTarget.StopCombat()
EndEvent

Event OnEffectFinish(actor akTarget, actor akCaster)
	akTarget.SetPlayerTeammate(false, false)
EndEvent
