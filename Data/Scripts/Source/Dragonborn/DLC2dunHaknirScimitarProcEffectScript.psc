Scriptname DLC2dunHaknirScimitarProcEffectScript extends ActiveMagicEffect
{Script for the proc effect on Haknir's Scimitars.}

Explosion property procExplosion Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.PlaceAtMe(procExplosion)
EndEvent