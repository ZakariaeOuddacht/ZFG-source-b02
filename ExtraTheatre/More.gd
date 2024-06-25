extends Node2D


func _ready():
	VisualServer.set_default_clear_color(Color.turquoise)


func _on_Button_button_down():
	Transisforms.play_exit_trans()
	yield(Transisforms,"trans_completed")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/Menu.tscn")
	Transisforms.play_enter_trans()


func _on_Button2_button_down():
	Transisforms.play_exit_trans()
	yield(Transisforms,"trans_completed")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/Changelog.tscn")
	Transisforms.play_enter_trans()


func _on_Button5_button_down():
	Transisforms.play_exit_trans()
	yield(Transisforms,"trans_completed")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/Credits.tscn")
	Transisforms.play_enter_trans()
