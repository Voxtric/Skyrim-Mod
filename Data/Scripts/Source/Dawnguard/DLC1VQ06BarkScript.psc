scriptName DLC1VQ06BarkScript extends objectReference
{This script is on the bark base object so that it can talk to the script when added to your inventory}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Properties Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

quest property DLC1VQ06 auto
{Quest that we need to talk to}
DLC1VQ06QuestScript property myQuestScript auto hidden

;miscObject property DLC1CanticleBarkFake auto



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Event Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;When this gets added to the player, silently remove it and call a function on the quest
;		that will add the 'real' bark that is in a referenceAlias
event onContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == game.getPlayer()
		;game.GetPlayer().removeItem(DLC1CanticleBarkFake, 1, abSilent = True)
		myQuestScript = DLC1VQ06 as DLC1VQ06QuestScript
		myQuestScript.GiveBark()
	endif
endEvent





