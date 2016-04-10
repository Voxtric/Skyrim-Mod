Scriptname DLC1falmerStaffSCRIPT extends ACTOR  
{A script to add the healer effect and force equip the staff so she'll patrol with it.}

WEAPON PROPERTY staff AUTO
SPELL PROPERTY healSpell AUTO

EVENT onLoad()
	SELF.equipItem(staff, TRUE)
	SELF.addSpell(healSpell)

ENDEVENT
