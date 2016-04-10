Scriptname DLC1VLCrimeScript extends Actor  

; When the player is a vampire lord, traditional crime reporting is turned off.
; Since most actors atttack the player in this form, that is fine.
; However, the DLC1VampireCrimeFaction members do not.
; Unfortunately, this also means they don't react to being attacked

Event OnHit(ObjectReference Attacker, Form AttackSource, Projectile AttackProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)

	if (Attacker as Actor).GetRace() == DLC1VampireBeastRace
		DLC1VampireFaction.SetPlayerEnemy()
		StartCombat(Game.GetPlayer())
		DLC1VampireFaction.SetPlayerEnemy(false)
	endIf
EndEvent

Race Property DLC1VampireBeastRace  Auto  

Faction Property DLC1VampireFaction  Auto  
