Scriptname TharstanComment extends Quest  
{Controls frequency of Tharstan's idle comments}

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property DLC2TharstanCommentNextAllowed auto

float DaysUntilNextAllowed = 0.05  ;about 1 "game hour" expressed in GameDaysPassed

Function Commented()
	float NextAllowed = GameDaysPassed.GetValue() + DaysUntilNextAllowed
	
; 	debug.trace("HirelingCommentScript Commented() setting DLC2TharstanCommentNextAllowed to " + NextAllowed)
	
	DLC2TharstanCommentNextAllowed.SetValue(NextAllowed)

EndFunction 
