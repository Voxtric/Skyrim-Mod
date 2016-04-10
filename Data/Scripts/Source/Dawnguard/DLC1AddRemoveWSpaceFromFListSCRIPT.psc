Scriptname DLC1AddRemoveWSpaceFromFListSCRIPT extends ObjectReference  
{Add or Removes a worldspace from a formlist every time the player enters this trigger.}

Worldspace Property myWorldspace Auto
{The Worldspace that we are going to Add/Remove from myFormlist}

Formlist Property myFormlist Auto
{The Formlist we are going to Add/Remove myWorldspace from/To}

Bool Property bShouldAdd = TRUE Auto
{
Add Worldspace to Formlist = TRUE (DEFAULT)
Remove World from Formlist = FALSE
}

Event onTriggerEnter(ObjectReference triggerRef)
	if bShouldAdd
		myFormlist.AddForm(myWorldspace)
	else
		myFormlist.RemoveAddedForm(myWorldspace)
	endif

	;if myFormList.HasForm(myWorldspace)
	;	debug.Trace(myFormList + " contains " + myWorldspace + " in it's list.")
	;else
	;	debug.Trace(myFormList + " DOES NOT contain " + myWorldspace + " in it's list.")
	;endif

EndEvent