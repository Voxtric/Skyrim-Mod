Scriptname SV01TharstanIgnoreCombatTriggerSCRIPT extends ObjectReference Hidden 

Quest Property DLC2SV01 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	(DLC2SV01 as DLC2SV01ConditionsSCRIPT).bTharstanIgnoreCombat = TRUE
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	(DLC2SV01 as DLC2SV01ConditionsSCRIPT).bTharstanIgnoreCombat = FALSE
EndEvent