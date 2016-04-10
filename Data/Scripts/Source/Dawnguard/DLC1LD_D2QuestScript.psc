Scriptname DLC1LD_D2QuestScript extends Quest  

Scene Property DLC1LD_00KatriaPleading Auto
Scene Property DLC1LD_00KatriaPleading02 Auto
Scene Property DLC1LD_01KatriaIntro Auto
Scene Property DLC1LD_02KatriaBackout Auto
Scene Property DLC1LD_03a_KatriaCommentBody Auto
Scene Property DLC1LD_03b_KatriaCommentBody Auto
Scene Property DLC1LD_03c_SketchbookReminder Auto
Scene Property DLC1LD_03d_SketchbookTaunt Auto
Scene Property DLC1LD_03e_KatriaCommentBodyStripped Auto
Scene Property DLC1LD_04_KatriaCommentPassage Auto
Scene Property DLC1LD_05_KatriaCommentMoreFalmer Auto
Scene Property DLC1LD_06_KatriaCommentQuiteAPlace Auto
Scene Property DLC1LD_07_KatriaCommentSealedDoor Auto
Scene Property DLC1LD_08_KatriaCommentSealedDoorSuccess Auto
Scene Property DLC1LD_09_KatriaCommentPods Auto
Scene Property DLC1LD_10_KatriaCommentDrop Auto
Scene Property DLC1LD_11a_KatriaCommentBow Auto
Scene Property DLC1LD_11b_KatriaCommentBowPickup Auto
Scene Property DLC1LD_12a_KatriaCommentFinalChamber Auto
Scene Property DLC1LD_12b_KatriaCommentImpressed Auto
Scene Property DLC1LD_13a_KatriaTip1 Auto
Scene Property DLC1LD_13b_KatriaTip2 Auto
Scene Property DLC1LD_13c_KatriaTip3 Auto
Scene Property DLC1LD_13d_KatriaTip4 Auto
Scene Property DLC1LD_14_KatriaCommentGotIt Auto
Scene Property DLC1LD_15_KatriaCommentTreasure Auto
Scene Property DLC1LD_04b_KatriaCommentResonator Auto

Function StopScenes()
	DLC1LD_00KatriaPleading.Stop()
	DLC1LD_00KatriaPleading02.Stop()
	DLC1LD_01KatriaIntro.Stop()
	DLC1LD_02KatriaBackout.Stop()
	DLC1LD_03a_KatriaCommentBody.Stop()
	DLC1LD_03b_KatriaCommentBody.Stop()
	DLC1LD_03c_SketchbookReminder.Stop()
	DLC1LD_03d_SketchbookTaunt.Stop()
       DLC1LD_03e_KatriaCommentBodyStripped.Stop()
	DLC1LD_04_KatriaCommentPassage.Stop()
      DLC1LD_04b_KatriaCommentResonator.Stop()
	DLC1LD_05_KatriaCommentMoreFalmer.Stop()
	DLC1LD_06_KatriaCommentQuiteAPlace.Stop()
	DLC1LD_07_KatriaCommentSealedDoor.Stop()
	DLC1LD_08_KatriaCommentSealedDoorSuccess.Stop()
	DLC1LD_09_KatriaCommentPods.Stop()
	DLC1LD_10_KatriaCommentDrop.Stop()
	DLC1LD_11a_KatriaCommentBow.Stop()
	DLC1LD_11b_KatriaCommentBowPickup.Stop()
	DLC1LD_12a_KatriaCommentFinalChamber.Stop()
	DLC1LD_13a_KatriaTip1.Stop()
	DLC1LD_13b_KatriaTip2.Stop()
	DLC1LD_13c_KatriaTip3.Stop()
	DLC1LD_13d_KatriaTip4.Stop()
	DLC1LD_14_KatriaCommentGotIt.Stop()
	DLC1LD_15_KatriaCommentTreasure.Stop()
EndFunction