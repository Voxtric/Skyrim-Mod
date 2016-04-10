Scriptname BYOHRestedAdoptionEffectScript extends ActiveMagicEffect 
{Effect script that removes the Adoption Rested Abilities (Father's Love / Mother's Love) after 8h.}

Spell Property pAbilityToRemove1 Auto
Spell Property pAbilityToRemove2 Auto
Int Property pHoursToWait Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForSingleUpdateGameTime(pHourstoWait)
EndEvent

Event OnUpdateGameTime()
	Game.GetPlayer().RemoveSpell(pAbilityToRemove1)
	Game.GetPlayer().RemoveSpell(pAbilityToRemove2)
EndEvent