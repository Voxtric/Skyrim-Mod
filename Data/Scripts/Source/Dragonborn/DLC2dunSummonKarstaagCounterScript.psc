Scriptname DLC2dunSummonKarstaagCounterScript extends ActiveMagicEffect
{Script for the Conjure Karstaag power. Swaps the power for the next one in sequence.}

Spell property mySpell Auto
Spell property nextSpell Auto
Quest property DLC2dunKarstaagQST Auto
int property stageToSet Auto
Message property displayMessage Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	displayMessage.Show()
	if (stageToSet == 255)
		Game.GetPlayer().RemoveSpell(mySpell)
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Game.GetPlayer().RemoveSpell(mySpell)
	if (nextSpell != None)
		Game.GetPlayer().AddSpell(nextSpell, False)
	EndIf
	if (stageToSet != 0)
		DLC2dunKarstaagQST.SetStage(stageToSet)
	EndIf
EndEvent