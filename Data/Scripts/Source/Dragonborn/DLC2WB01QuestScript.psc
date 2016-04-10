Scriptname DLC2WB01QuestScript extends Quest conditional


ReferenceAlias Property Journal auto
ReferenceAlias Property Torkild auto
ReferenceAlias Property JournalChest auto
bool Property TorkildTransformed auto conditional


Function PrepTorkild(Actor torkildRef)
; 	Debug.TraceStack("DLC2WB01: Prepping Torkild alias.")
	Torkild.ForceRefTo(torkildRef)
EndFunction

Function ClearTorkild()
; 	Debug.TraceStack("DLC2WB01: Clearing Torkild alias.")
	Torkild.Clear()
	JournalChest.GetReference().AddItem(Journal.GetReference())
EndFunction
