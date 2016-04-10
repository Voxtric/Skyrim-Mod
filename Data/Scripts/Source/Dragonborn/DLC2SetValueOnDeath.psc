Scriptname DLC2SetValueOnDeath extends ReferenceAlias  
{Upon death, the creature sets the DLC2SB01WallsTranslated global variable to 1}

;Properties
GlobalVariable Property DLC2SV01WallsTranslated  Auto

Event OnDeath(Actor akKiller)
    if (akKiller == Game.GetPlayer())
	DLC2SV01WallsTranslated.SetValue(1)
   endif
endEvent  
