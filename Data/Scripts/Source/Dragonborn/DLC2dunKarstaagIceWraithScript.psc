ScriptName DLC2dunKarstaagIceWraithScript extends ObjectReference
{Script for the Standard Karstaag's summoned ice wraiths.}

ReferenceAlias property KarstaagAlias Auto

Event OnLoad()
	(KarstaagAlias as DLC2dunKarstaagBattleScript).RecordIceWraith(Self)
EndEvent