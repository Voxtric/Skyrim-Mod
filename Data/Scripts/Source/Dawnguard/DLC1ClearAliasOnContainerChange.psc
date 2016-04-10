Scriptname DLC1ClearAliasOnContainerChange extends ReferenceAlias  
{When this alias changes container to the player the selected Aliases will be cleared.}

Referencealias Property AliasToClear01 Auto
Referencealias Property AliasToClear02 Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if akNewContainer == Game.GetPlayer()
			AliasToClear01.Clear()
			AliasToClear02.Clear()
		endif
endEvent