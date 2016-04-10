ScriptName DLC1dunLevelCheck extends ObjectReference
{On cell load, check the player's level. If it's greater than MinLevel, enable this object.}

int property MinLevel = 16 Auto
{The level at which to enable this ref. Defaults to 16 (for Chaurus Hunter)}

Event OnCellLoad()
	if (Game.GetPlayer().GetLevel() >= MinLevel)
		Self.Enable()
	Else
		Self.Disable()
	EndIf
EndEvent