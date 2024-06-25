extends CanvasLayer

onready var animationPlayer = $AnimationPlayer
signal trans_completed

func play_exit_trans():
	animationPlayer.play("ExitLevel")
	
func play_enter_trans():
	animationPlayer.play("EnterLevel")


# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("trans_completed")
