Scriptname DLC2ReferenceAliasArrayScript extends Quest  

;jduvall -- please talk to me before changing this script

ReferenceAlias[] Property AliasArray auto
{All the arrays that make up the "array"}

objectReference[] Property RefArray auto ;we are using a seperate array to hold references and shuffling refs around in that because it's much less overhead than shuffling refs into and out of aliases - requested by mlipari and jlundin
{IMPORTANT! This needs to be an array of empty values with the same number of values as the number of aliases in AliasArray.}

bool Property TraceAliasRefs auto
; {Debug: default = false, if true will debug.trace() contents of all the aliases in the array after ForceRefInto() or ClearRefFrom()}

bool threadLock

Function LockThread()
	while threadLock 
		utility.wait(1)
	endWhile

	threadLock = true
EndFunction

Function UnlockThread()
	threadLock = false
EndFunction

Function DoIfFull()
	;empty function to do different stuff in extended scripts
EndFunction


ReferenceAlias function ForceRefToAndReturnAlias(objectReference RefToAdd)
	LockThread()

	If RefArray[RefArray.length - 1]  ;if the last slot is filled
		DoIfFull()
	endif

	ReferenceAlias ReturnRefAlias
	int foundRefIndex = RefArray.find(RefToAdd)

	if  foundRefIndex >= 0
; 		Debug.Trace(self + "ForceRefInto([" + RefToAdd + "]) is already in alias [" + AliasArray[foundRefIndex] + "], so NOT forcing into anything and will RETURN FALSE.")
		ReturnRefAlias = None

	else
				
		objectReference RefToReplace = PromoteRefs()
		ReferenceAlias AliasToReplace = FindRef(RefToReplace)
		
; 		Debug.Trace(self + "ForceRefInto([" + RefToAdd + "]) will and force reference into " + AliasToReplace)

		RefArray[0] = RefToAdd
		AliasToReplace.ForceRefTo(RefToAdd)
		ReturnRefAlias = AliasToReplace

	endif

	if TraceAliasRefs
		TraceArrayRefs()
	endif

	UnlockThread()

	return ReturnRefAlias

EndFunction

bool Function ForceRefInto(objectReference RefToAdd)
	return ForceRefToAndReturnAlias(RefToAdd) as bool

EndFunction


bool Function ClearRefFrom(objectReference RefToClear)

	LockThread()

	bool ReturnBool
	ReferenceAlias FoundAlias = FindRef(RefToClear)

	if FoundAlias
; 		Debug.Trace(self + "ClearRefFrom([" + RefToClear + "]) found Reference in Alias [" + FoundAlias + "], so will clear alias and RETURN TRUE")
		FoundAlias.Clear()
		RefArray[RefArray.Find(RefToClear)] = None
		returnBool = true

	else
; 		Debug.Trace(self + "ClearRefFrom([" + RefToClear + "]) did NOT find reference in any aliases, will NOT clear anything, and will RETURN FALSE")
		returnBool = false
	endif

	if TraceAliasRefs
		TraceArrayRefs()
	endif

	UnlockThread()
	return returnBool


EndFunction

ReferenceAlias Function FindRef(objectReference RefToFind)
; 	debug.Trace(self + "FindRef([" + RefToFind + "])")

	int index = 0
	bool found = false

	ReferenceAlias AliasToReturn

   	while (index < AliasArray.Length) && found == false

    	if AliasArray[index].GetReference() == RefToFind
    		AliasToReturn = AliasArray[index]
    		found = true

    	endif

    	index += 1

   	endWhile

;    	Debug.Trace(self + "FindRef([" + RefToFind + "]) found in alias " + AliasToReturn)

   	RETURN AliasToReturn
   		
EndFunction

objectReference Function PromoteRefs()
; 	Debug.Trace(self + "PromoteRefs()")
	int index = RefArray.Length - 1
	objectReference RefToReturn = RefArray[index]

   	while (index >  0)

   		objectReference currentRef = RefArray[index - 1]

   		if currentRef
			RefArray[index] = (currentRef)
		endif
				
		index -= 1

	endWhile

	return RefToReturn

EndFunction

function TraceArrayRefs()
	int index = 0

   	while (index < AliasArray.Length)
;    		debug.trace("Alias: " + AliasArray[Index] + " has reference: " + AliasArray[Index].GetReference())
    	index += 1
   	endWhile

EndFunction