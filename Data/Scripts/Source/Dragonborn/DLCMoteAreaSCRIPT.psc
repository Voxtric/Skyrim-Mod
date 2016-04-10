Scriptname DLCMoteAreaSCRIPT extends ObjectReference  

ImageSpaceModifier Property DLC2MoteIMOD Auto
ImageSpaceModifier Property FadeToWhiteHoldImod Auto
EffectShader Property GhostCallValorFXShader Auto

event onLoad()
	game.getPlayer().SetAlpha(0.5)
	GhostCallValorFXShader.Play(game.getPlayer())
	FadeToWhiteHoldImod.ApplyCrossFade(afFadeDuration = 0.01)
	utility.wait(1.0)
	DLC2MoteIMOD.ApplyCrossFade(afFadeDuration = 2.0)
ENDEVENT

event onunLoad()
	game.getPlayer().SetAlpha(1.0)
	GhostCallValorFXShader.Stop(game.getPlayer())
	ImageSpaceModifier.RemoveCrossFade()
ENDEVENT