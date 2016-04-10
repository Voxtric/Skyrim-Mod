Scriptname DLC1LycanthropyRegiftQuestScript extends Quest  


Quest Property CompanionsCentral auto

ImageSpaceModifier Property FadeToBlack auto
ImageSpaceModifier Property HoldBlack auto
ImageSpaceModifier Property FadeFromBlack auto

Spell Property WerewolfCureDisease auto
Spell Property Immunity auto
Spell Property BeastForm auto

Keyword Property VampireKeyword auto
Quest Property PlayerVampireQuest auto

float Property FadeSeconds auto

Function Regift()
    ; black you out
	FadeToBlack.Apply()
    Utility.Wait(2.1)
    FadeToBlack.PopTo(HoldBlack)

    ; HoldBlack.Apply()

    ; make you immune to disease, remove existing diseases
    if (Game.GetPlayer().HasKeyword(VampireKeyword))
        (PlayerVampireQuest as PlayerVampireQuestScript).VampireCure(Game.GetPlayer())
    endif
    WerewolfCureDisease.Cast(Game.GetPlayer())
    Game.GetPlayer().AddSpell(Immunity, false)

    ; give you the spell
    Game.GetPlayer().AddSpell(BeastForm)
    (CompanionsCentral as CompanionsHousekeepingScript).TempUnderforgeAccess = true
    (CompanionsCentral as CompanionsHousekeepingScript).PlayerHasBeastBlood = true

    ; wake up
    HoldBlack.PopTo(FadeFromBlack)
    ; HoldBlack.Remove()
    Utility.Wait(3)
    FadeFromBlack.Remove()

	Stop() ; player can't do this again
EndFunction
