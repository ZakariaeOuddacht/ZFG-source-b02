extends Node2D


func _ready():
	get_tree().paused = false
	$"/root/MenuSong".play()
	$AnimationPlayer.play("Scale")
	$AnimationPlayer2.play("The Hell?")
	VisualServer.set_default_clear_color(Color.turquoise)


func _on_Button_button_down():
	Transisforms.play_exit_trans()
	yield(Transisforms,"trans_completed")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/HowToStart.tscn")
	Transisforms.play_enter_trans()



func _on_Button2_button_down():
	Transisforms.play_exit_trans()
	yield(Transisforms,"trans_completed")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/More.tscn")
	Transisforms.play_enter_trans()


func _on_Button3_button_down():
	$Button3.visible = false
	$Button4.visible = true


func _on_Button5_button_down():
	get_tree().quit()
