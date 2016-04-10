Scriptname DLC2SummonAshGuardianActorScript extends Actor  

DLC2DialogueTelMithrynScript Property DLC2DialogueTelMithryn Auto
MiscObject Property DLC2HeartStone  Auto  
Faction Property DLC2SummonedAshGuardianFaction  Auto  
Message Property DLC2NoHeartStoneMSG Auto

bool FirstLoad 

Event OnLoad()
	DLC2DialogueTelMithryn.DLC2CurrentSummonedAshGuardian.kill()
	DLC2DialogueTelMithryn.DLC2CurrentSummonedAshGuardian.delete()
	DLC2DialogueTelMithryn.DLC2CurrentSummonedAshGuardian = self

; 	debug.trace("ASH GUARDIAN: heart stones = " + game.GetPlayer().GetItemCount(DLC2HeartStone))
	if game.GetPlayer().GetItemCount(DLC2HeartStone) == 0
		DLC2NoHeartStoneMSG.Show()
		RemoveFromFaction(DLC2SummonedAshGuardianFaction)
		SetAV("Aggression", 0)
		Startcombat(game.GetPlayer())
; 		debug.trace("ASH GUARDIAN: turned aggressive")
	else
		game.GetPlayer().RemoveItem(DLC2HeartStone, 1)
	endif
EndEvent

Event OnDeath(actor akKiller)
	Disable(true)
	Delete()
EndEvent

