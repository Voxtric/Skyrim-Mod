Scriptname DLC2dunKarstaagSpellFailScript extends ActiveMagicEffect
{Display the spell failed message.}

Message property DLC2dunKarstaagSpellFailedMessage Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DLC2dunKarstaagSpellFailedMessage.Show()
EndEvent