extends Node2D

export(String, FILE, "*.tscn") var target_level_path = ""

func _ready():
	$CanvasLayer/VideoPlayer.play()
	yield($CanvasLayer/VideoPlayer, "finished")
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene(target_level_path)


func _on_Butt_pressed():
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene(target_level_path)
