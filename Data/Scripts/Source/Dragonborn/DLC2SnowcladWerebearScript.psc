Scriptname DLC2SnowcladWerebearScript extends ObjectReference  


Race Property NordRace auto


Event OnReset()
	Actor me = ((self as ObjectReference) as Actor)
	me.Resurrect()
	me.SetRace(NordRace)
EndEvent