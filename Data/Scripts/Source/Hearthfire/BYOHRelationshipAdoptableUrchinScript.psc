Scriptname BYOHRelationshipAdoptableUrchinScript extends Quest Conditional
{Quest script for BYOHRelationshipAdoptableUrchins. Manages their aliases and disables adoption on them at the appropriate time.}

ReferenceAlias property Sofie Auto		;Urchin Children
ReferenceAlias property Alesan Auto
ReferenceAlias property Lucia Auto
ReferenceAlias property Blaise Auto

Faction property BYOHRelationshipAdoptableFaction Auto	;Standard Adoptable faction.

;When an Urchin is adopted, remove them from their Alias on this quest to remove any dialogue or scripts from them.
Function CheckAdoptUrchinChild(ObjectReference child, int childNum)
	if (child == Sofie.GetActorRef())
		Sofie.Clear()
		;Debug.Trace("Sophie Alias Cleared")
	ElseIf (child == Alesan.GetActorRef())
		Alesan.Clear()
		;Debug.Trace("Alesan Alias Cleared")
	ElseIf (child == Lucia.GetActorRef())
		Lucia.Clear()
		;Debug.Trace("Lucia Alias Cleared")
	ElseIf (child == Blaise.GetActorRef())
		Blaise.Clear()
		;Debug.Trace("Blaise Alias Cleared")
	EndIf
EndFunction

;When the player has adopted two children, disable the adoption dialogue from the remaining urchins.
Function DisableUrchinAdoption()
	;Debug.Trace("Disabling Urchin Adoption")
	if (Sofie.GetActorRef() != None)
		Sofie.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
	EndIf
	if (Alesan.GetActorRef() != None)
		Alesan.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
	EndIf
	if (Lucia.GetActorRef() != None)
		Lucia.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
	EndIf
	if (Blaise.GetActorRef() != None)
		Blaise.GetActorRef().SetFactionRank(BYOHRelationshipAdoptableFaction, -1)
	EndIf
EndFunction
