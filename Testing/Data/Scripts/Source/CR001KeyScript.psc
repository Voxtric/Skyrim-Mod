Scriptname CR001KeyScript extends ReferenceAlias  

Quest Property CR001Grandmother  Auto  

Actor Property PlayerRef  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		CR001Grandmother.SetStage(50)
	endif
endevent