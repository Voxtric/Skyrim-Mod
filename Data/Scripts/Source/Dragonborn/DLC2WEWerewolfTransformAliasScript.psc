Scriptname DLC2WEWerewolfTransformAliasScript extends ReferenceAlias  
{script on WE aliases that are werewolves and should change if they enter combat}

Spell Property WerewolfChangeFX auto
{autofill}

bool transformed

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if transformed == false
		transformed = true

		WerewolfChangeFX.cast(GetActorReference())

	endif



endEvent