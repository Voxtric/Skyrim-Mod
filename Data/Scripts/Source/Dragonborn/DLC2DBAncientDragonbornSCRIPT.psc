Scriptname DLC2DBAncientDragonbornSCRIPT extends Actor  

ARMOR PROPERTY dragonArmor AUTO
EFFECTSHADER PROPERTY dragonArmsFX AUTO
FLOAT PROPERTY timer AUTO
OBJECTREFERENCE PROPERTY dbAncientMarker AUTO

EVENT onLoad()
	;Self.addItem(axe)
	Self.equipItem(dragonArmor, TRUE, TRUE)
	dragonArmsFX.Play(Self)

	utility.wait(timer)

	Self.disable()
	Self.moveTo(dbAncientMarker)

ENDEVENT

EVENT onUnload()
	Self.unEquipItem(dragonArmor, TRUE)
	dragonArmsFX.Stop(Self)

ENDEVENT