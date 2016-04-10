Scriptname DLC1VQ01SeranaScript extends ReferenceAlias  


Ammo Property ElderScrollAmmo auto


Event OnCellAttach()
	Debug.Trace("RNPC: Equipping Elder Scroll on Serana's back.")
	GetActorReference().EquipItem(ElderScrollAmmo, true)
EndEvent
