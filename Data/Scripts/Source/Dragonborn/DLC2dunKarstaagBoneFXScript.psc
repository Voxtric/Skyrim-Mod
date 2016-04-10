Scriptname DLC2dunKarstaagBoneFXScript extends ObjectReference

EffectShader property EnchFrostFXShader Auto

Function TriggerBones()
	RegisterForSingleUpdate(0.1)
EndFunction

Event OnUpdate()
	EnchFrostFXShader.Play(Self, 5)
	Utility.Wait(1.5)
	Self.Disable(True)
EndEvent
