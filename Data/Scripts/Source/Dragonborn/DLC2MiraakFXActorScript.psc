Scriptname DLC2MiraakFXActorScript extends Actor  
{Attached to various Miraak actors -- Controls effects for Miraak}

EffectShader Property DLC2MiraakTeleportFXS auto
VisualEffect Property DLC2MiraakSelfAttachVisualEffectMQ01 auto

Event OnLoad()
	DLC2MiraakTeleportFXS.play(self)
	DLC2MiraakSelfAttachVisualEffectMQ01.play(self)
EndEvent