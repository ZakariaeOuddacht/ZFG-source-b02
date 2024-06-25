extends Node2D


func _ready():
	VisualServer.set_default_clear_color(Color.turquoise)


func _on_Button_pressed():
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/HowToStart.tscn")


func _on_Button2_pressed():
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://VersusMode.tscn")
