scriptName LokirsDraugrResurrection extends Actor
{Resurrects the two dead Draugr in Lokir's Tomb.}

Spell property reanimateSpell Auto

Event OnActivate(ObjectReference akActionRef)
  if (akActionRef != Game.GetPlayer())
      reanimateSpell.Cast(Self, Self)
  EndIf
EndEvent