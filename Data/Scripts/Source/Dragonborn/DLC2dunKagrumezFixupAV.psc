ScriptName DLC2dunKagrumezFixupAV extends Actor
{Sets AV06=1, to work around a Hearthfire bug and allow the spider and sphere to be adopted normally.}

Event OnLoad()
	Self.SetAV("Variable06", 1)
EndEvent