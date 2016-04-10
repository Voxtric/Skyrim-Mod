Scriptname DLC1SeranaLevelingScript extends Actor 

Keyword Property VampireKeyword auto

Event OnInit()
	RegisterForUpdateGameTime(24)
EndEvent

Event OnUpdateGameTime()
	If IsInCombat() == False
		CurrentLevel = GetLevel()
		If CurrentLevel > LastLevel
			If CurrentLevel >= Stage5
				; currently undefined, set LastLevel to shut down
				LastLevel = Stage5
			ElseIf Currentlevel >= Stage4
				RemoveSpell( crVampireDrain02 )
				RemoveSpell( crVampireDrain03 )
				RemoveSpell( crVampireDrain04 )
				RemoveSpell( crVampireDrain04 )
				RemoveSpell( RaiseZombieLeftHand )
				RemoveSpell( ReanimateCorpseLeftHand )
				RemoveSpell( IceSpikeLeftHand )
				RemoveSpell( LightningBoltLeftHand )

				if (HasKeyword(VampireKeyword))
					AddSpell( crVampireDrain06 )
				endif
				AddSpell( RevenantLeftHand )
				AddSpell( IceStormLeftHand )
				AddSpell( ChainLightningLeftHand )

			ElseIf CurrentLevel >= Stage3
				RemoveSpell( crVampireDrain02 )
				RemoveSpell( crVampireDrain03 )
				RemoveSpell( crVampireDrain04 )
				RemoveSpell( RaiseZombieLeftHand )
				RemoveSpell( ReanimateCorpseLeftHand )

				if (HasKeyword(VampireKeyword))
					AddSpell( crVampireDrain05 )
				endif
				AddSpell( LightningBoltLeftHand )
				AddSpell( RevenantLeftHand)

			ElseIf CurrentLevel >= Stage2
				RemoveSpell( crVampireDrain02 )
				RemoveSpell( crVampireDrain03 )
				RemoveSpell( RaiseZombieLeftHand )

				if (HasKeyword(VampireKeyword))
					AddSpell( crVampireDrain04 )
				endif
				AddSpell( LightningBoltLeftHand )

			ElseIf CurrentLevel >= Stage1
				RemoveSpell( crVampireDrain02 )
				RemoveSpell( RaiseZombieLeftHand )

				if (HasKeyword(VampireKeyword))
					AddSpell( crVampireDrain03 )
				endif
				AddSpell( ReanimateCorpseLeftHand )

			EndIf
			LastLevel = CurrentLevel
		EndIf
	EndIf
EndEvent

Event OnCombatStateChange(actor akTarget, int CombatState)
	if CombatState == 2
		CurrentHealth = GetActorValue("Health") 
		if CurrentHealth <= 0
			RestoreActorValue("Health", -CurrentHealth + 1.0)
		endIf
	endIf
EndEvent

Float Property CurrentHealth Auto
Int Property CurrentLevel Auto
Int Property LastLevel  Auto  

Int Property Stage1 = 20 Auto  
Int Property Stage2 = 28 Auto  
Int Property Stage3 = 38 Auto  
Int Property Stage4 = 48 Auto  
Int Property Stage5 = 99 Auto  

SPELL Property crVampireDrain02  Auto  
SPELL Property crVampireDrain03  Auto  
SPELL Property crVampireDrain04  Auto  
SPELL Property crVampireDrain05  Auto  
SPELL Property crVampireDrain06  Auto  

SPELL Property IceSpikeLeftHand  Auto  
SPELL Property ReanimateCorpseLeftHand  Auto  
SPELL Property LightningBoltLeftHand  Auto  
SPELL Property RevenantLeftHand  Auto  
SPELL Property IceStormLeftHand  Auto  
SPELL Property ChainLightningLeftHand  Auto  
SPELL Property RaiseZombieLeftHand  Auto  
