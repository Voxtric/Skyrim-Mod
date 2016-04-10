scriptName DLC1VQ06AncestorTreeActivator extends objectReference
{This script goes on an invisible activator around the tree and handles getting
		the player into/out of furniture and scraping the bark}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Properties Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

objectReference property myTree auto
{This is the tree that this will be harvesting}

objectReference property myFurniture auto
{This is the furniture we will kick the player into}

string property ExitEvent = "IdleFurnitureExit" auto
{This string is the event that should be fired when the player leaves the furniture}

quest property DLC1VQ06 auto
{Quest we will need to check/set stages on}

DLC1VQ06QuestScript property myQuestScript auto hidden

miscObject Property DLC1CanticleBark auto

Message Property pDLC1VQ06KnifeMessage Auto
{This message appears if the player is on the quest but tries to activate without the draw knife}

GlobalVariable Property pDLC1VQ06HaveKnife  Auto

int property TreeNumber auto
{This value is used to tell the quest script which tree this is}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Event Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;OnActivate, if it is the player and they have the draw knife activate the furniture to play the scrape anim
event onActivate(objectReference activateRef)
	if activateRef == game.getPlayer()
		if pDLC1VQ06HaveKnife.GetValue() == 1
			myFurniture.activate(game.getPlayer())
			unRegisterForAnimationEvent(game.getPlayer(), ExitEvent)
			registerForAnimationEvent(game.getPlayer(), ExitEvent)
		else
			pDLC1VQ06KnifeMessage.Show()
		endif
	endif	
endEvent

;when the player exits the furniture, script activate the tree to give the fake bark and deplete the tree flora
;		The fake bark has a script on the base object that will call a function on the quest script.
event onAnimationEvent(ObjectReference akSource, string asEventName)
	;debug.Trace(self + ": has received event '" + asEventName + "' from '" + akSource + "'")
	if akSource == game.GetPlayer()
		if  asEventName == ExitEvent
			myTree.Activate(game.GetPlayer())
			self.disable()
			myQuestScript = DLC1VQ06 as DLC1VQ06QuestScript
			myQuestScript.TreeHarvested(TreeNumber)
			unRegisterForAnimationEvent(game.getPlayer(), ExitEvent)
			;self.Disable()
		endif
	endif
endEvent
