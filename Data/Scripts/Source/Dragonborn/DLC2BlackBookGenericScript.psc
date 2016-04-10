Scriptname DLC2BlackBookGenericScript extends ObjectReference
{this goes on the placed black book instead of DLC2BlackBookScript
because we never want this reference to be end up in the player's inventory
}

;Event OnRead()
;  ;	debug.trace(self + "OnRead ")
 ;	if (DLC2BooksActive.GetValueInt() == 1) ; for Shane's debugging during layout
 ;		; pass along myBook rather than self - ReadBook always wants the book's real reference
;  ;		debug.trace(self + " reading - pass along myBook=" + myBook)
;		DLC2BookDungeonController.ReadBook(myBook, self)
;	endif
;endEvent

;Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
;	; if this ever goes into anyone's inventory, remove it - we don't want anyone to ever have this in inventory
;	akNewContainer.RemoveItem(self, 99, true)
;endEvent

GlobalVariable Property DLC2BooksActive auto

DLC2BookDungeonControllerScript Property DLC2BookDungeonController  Auto  

DLC2BlackBookScript Property myBook  Auto  
{points to real book reference - necessary because 
most reference data becomes inaccessible from an inventory object
}

