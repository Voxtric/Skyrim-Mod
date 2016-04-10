Scriptname DLC1Durnehviir extends Actor  


Event OnInit()
	If GetLevel() <=20
		; do nothing
	ElseIf GetLevel() <= 30
		AddSpell(DLC1DurnehvirStatsBoost03)

		RemoveShout(DragonFrostBreathShout02)
		AddShout(DragonFrostBreathShout03)

		RemoveSpell(crDragonUnarmedDamage02)
		AddSpell(crDragonUnarmedDamage03)
	ElseIf GetLevel() <= 40
		RemoveSpell(DLC1DurnehvirStatsBoost03)
		AddSpell(DLC1DurnehvirStatsBoost04)

		RemoveShout(DragonFrostBreathShout02)
		RemoveShout(DragonFrostBreathShout03)
		RemoveShout(DLC1DragonDrainVitalityShout03)
		AddShout(DragonFrostBreathShout04)
		AddShout(DLC1DragonDrainVitalityShout04)

		RemoveSpell(crDragonUnarmedDamage02)
		RemoveSpell(crDragonUnarmedDamage03)
		AddSpell(crDragonUnarmedDamage04)
	ElseIf GetLevel() <= 50
		RemoveSpell(DLC1DurnehvirStatsBoost03)
		RemoveSpell(DLC1DurnehvirStatsBoost04)
		AddSpell(DLC1DurnehvirStatsBoost05)

		RemoveShout(DragonFrostBreathShout02)
		RemoveShout(DragonFrostBreathShout03)
		RemoveShout(DragonFrostBreathShout04)
		RemoveShout(DLC1DragonDrainVitalityShout03)
		RemoveShout(DLC1DragonDrainVitalityShout04)
		AddShout(DragonFrostBreathShout05)
		AddShout(DLC1DragonDrainVitalityShout05)

		RemoveSpell(crDragonUnarmedDamage02)
		RemoveSpell(crDragonUnarmedDamage03)
		RemoveSpell(crDragonUnarmedDamage04)
		AddSpell(crDragonUnarmedDamage05)
	ElseIf GetLevel() <= 62
		RemoveSpell(DLC1DurnehvirStatsBoost03)
		RemoveSpell(DLC1DurnehvirStatsBoost04)
		RemoveSpell(DLC1DurnehvirStatsBoost05)
		AddSpell(DLC1DurnehvirStatsBoost06)

		RemoveShout(DragonFrostBreathShout02)
		RemoveShout(DragonFrostBreathShout03)
		RemoveShout(DragonFrostBreathShout04)
		RemoveShout(DragonFrostBreathShout05)
		RemoveShout(DLC1DragonDrainVitalityShout03)
		RemoveShout(DLC1DragonDrainVitalityShout04)
		RemoveShout(DLC1DragonDrainVitalityShout05)
		AddShout(DLC1DragonFrostBreathShout06)
		AddShout(DLC1DragonDrainVitalityShout06)

		RemoveSpell(crDragonUnarmedDamage02)
		RemoveSpell(crDragonUnarmedDamage03)
		RemoveSpell(crDragonUnarmedDamage04)
		RemoveSpell(crDragonUnarmedDamage05)
		AddSpell(DLC1crDragonUnarmedDamage06)
	Elseif GetLevel() > 62
		RemoveSpell(DLC1DurnehvirStatsBoost03)
		RemoveSpell(DLC1DurnehvirStatsBoost04)
		RemoveSpell(DLC1DurnehvirStatsBoost05)
		RemoveSpell(DLC1DurnehvirStatsBoost06)
		AddSpell(DLC1DurnehvirStatsBoost07)

		RemoveShout(DragonFrostBreathShout02)
		RemoveShout(DragonFrostBreathShout03)
		RemoveShout(DragonFrostBreathShout04)
		RemoveShout(DragonFrostBreathShout05)
		RemoveShout(DLC1DragonFrostBreathShout06)
		RemoveShout(DLC1DragonDrainVitalityShout03)
		RemoveShout(DLC1DragonDrainVitalityShout04)
		RemoveShout(DLC1DragonDrainVitalityShout05)
		RemoveShout(DLC1DragonDrainVitalityShout06)
		AddShout(DLC1DragonFrostBreathShout07)
		AddShout(DLC1DragonDrainVitalityShout07)

		RemoveSpell(crDragonUnarmedDamage02)
		RemoveSpell(crDragonUnarmedDamage03)
		RemoveSpell(crDragonUnarmedDamage04)
		RemoveSpell(crDragonUnarmedDamage05)
		RemoveSpell(DLC1crDragonUnarmedDamage06)
		AddSpell(DLC1crDragonUnarmedDamage07)
	EndIf
EndEvent

Shout Property DragonFrostBreathShout02  Auto  
Shout Property DragonFrostBreathShout03  Auto  
Shout Property DragonFrostBreathShout04  Auto  
Shout Property DragonFrostBreathShout05  Auto  
Shout Property DLC1DragonFrostBreathShout06  Auto  
Shout Property DLC1DragonFrostBreathShout07  Auto  

SPELL Property crDragonUnarmedDamage02  Auto  
SPELL Property crDragonUnarmedDamage03  Auto  
SPELL Property crDragonUnarmedDamage04  Auto  
SPELL Property crDragonUnarmedDamage05  Auto  
SPELL Property DLC1crDragonUnarmedDamage06  Auto  
SPELL Property DLC1crDragonUnarmedDamage07  Auto  

Shout Property DLC1DragonDrainVitalityShout03  Auto  
Shout Property DLC1DragonDrainVitalityShout04  Auto  
Shout Property DLC1DragonDrainVitalityShout05  Auto  
Shout Property DLC1DragonDrainVitalityShout06  Auto  
Shout Property DLC1DragonDrainVitalityShout07  Auto  

SPELL Property DLC1DurnehvirStatsBoost02  Auto 
SPELL Property DLC1DurnehvirStatsBoost03  Auto 
SPELL Property DLC1DurnehvirStatsBoost04  Auto 
SPELL Property DLC1DurnehvirStatsBoost05  Auto 
SPELL Property DLC1DurnehvirStatsBoost06  Auto 
SPELL Property DLC1DurnehvirStatsBoost07  Auto 
