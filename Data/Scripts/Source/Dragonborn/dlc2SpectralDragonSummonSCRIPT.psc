Scriptname dlc2SpectralDragonSummonSCRIPT extends Actor  

FLOAT PROPERTY timer AUTO

EVENT onLoad()

	utility.wait(timer)	

	self.disable()

ENDEVENT