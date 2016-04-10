ScriptName DLC2dunKarstaagIceWraithSummonedScript extends Actor
{Script for the Summoned Karstaag's summoned ice wraiths.}

ReferenceAlias property ConjuredKarstaagAlias Auto

Event OnLoad()
	(ConjuredKarstaagAlias.GetActorRef() as DLC2dunKarstaagSummonScript).RecordIceWraith(Self)
EndEvent