Scriptname BYOHHouseWEScript extends WEScript  
{extends WEScript to add StopQuestWhenAliasesUnload functionality}

; override update loop to use StopQuestWhenAliasesUnload 
Event OnUpdateGameTime()
; 	debug.trace(self + "OnUpdateGameTime()")

	if StopQuestWhenAliasesUnload
		parent.OnUpdateGameTime()
	EndIf
EndEvent
