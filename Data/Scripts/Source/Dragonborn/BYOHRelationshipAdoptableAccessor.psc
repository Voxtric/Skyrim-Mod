Scriptname BYOHRelationshipAdoptableAccessor extends Quest
{Quest Script for BYOHRelationshipAdoptable. Provides (comparatively) safe cross-DLC access to the Adoptable script's array.}

;The array of orphanable children used by BYOHRelationshipAdoptableScript.
Actor[] property OrphanableChildren Auto

;Adds the child to the list of adoptable children maintained by BYOHRelationshipAdoptableScript.
;Returns true if the child was added successfully, false otherwise.
bool Function AddOrphanableChild(Actor child)
	int i = 0
; 	Debug.Trace(OrphanableChildren + " " + OrphanableChildren.Length)
	While (i < OrphanableChildren.Length)
; 		Debug.Trace("Now checking: " + OrphanableChildren[i])	
		if (OrphanableChildren[i] == None)
			OrphanableChildren[i] = child
			return True
		EndIf
		i = i + 1
	EndWhile
	return False
EndFunction
