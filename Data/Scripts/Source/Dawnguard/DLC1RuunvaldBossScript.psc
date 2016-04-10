Scriptname DLC1RuunvaldBossScript extends ObjectReference  

Actor Property Vigilant01  Auto  
Actor Property Vigilant02  Auto  
Actor Property Vigilant03  Auto  
Actor Property Vigilant04  Auto  
Actor Property Vigilant05  Auto  
Actor Property Vigilant06  Auto  
Actor Property Vigilant07  Auto  
Actor Property Vigilant08  Auto  
Actor Property Vigilant09  Auto  
Actor Property Vigilant10  Auto  
Actor Property Vigilant11  Auto  
Actor Property Vigilant12  Auto  
Actor Property Vigilant13  Auto  
Actor Property Vigilant14  Auto  
Actor Property Vigilant15  Auto  

Key Property DLC1RuunvaldKey01 Auto

Event OnDeath(Actor akKiller)
	Vigilant01.Kill()
	Vigilant02.Kill()
	Vigilant03.Kill()
	Vigilant04.Kill()
	Vigilant05.Kill()
	Vigilant06.Kill()
	Vigilant07.Kill()
	Vigilant08.Kill()
	Vigilant09.Kill()
	Vigilant10.Kill()
	Vigilant11.Kill()
	Vigilant12.Kill()
	Vigilant13.Kill()
	Vigilant14.Kill()
	Vigilant15.Kill()
	AddItem(DLC1RuunvaldKey01,1,True)
endEvent


