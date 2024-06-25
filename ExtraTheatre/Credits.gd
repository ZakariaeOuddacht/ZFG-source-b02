extends Node2D


func _ready():
	VisualServer.set_default_clear_color(Color. turquoise)


func _on_Button_button_down():
	Transisforms.play_exit_trans()
	yield(Transisforms,"trans_completed")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/More.tscn")
	Transisforms.play_enter_trans()
