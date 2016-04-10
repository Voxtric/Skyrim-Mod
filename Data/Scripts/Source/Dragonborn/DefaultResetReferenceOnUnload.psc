Scriptname DefaultResetReferenceOnUnload extends ReferenceAlias  
{When this reference unloads, reset an object reference.}

Event OnUnload()
   ReferenceToReset.Reset()
endEvent

ObjectReference Property ReferenceToReset Auto
