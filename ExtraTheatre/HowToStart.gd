extends Node2D

# List of labels
var labels = []

func _ready():
	VisualServer.set_default_clear_color(Color.turquoise)
	# Populate the labels array with references to Label2 to Label6
	for i in range(2, 7):
		var label = get_node("Label" + str(i))
		labels.append(label)

	# Hide all labels
	hide_all_labels()

	# Choose a random index
	var random_index = randi() % labels.size()

	# Make the chosen label visible
	labels[random_index].visible = true

func hide_all_labels():
	# Hide all labels
	for label in labels:
		label.visible = false


func _on_Button_button_down():
	$"/root/MenuSong".stop()
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://DreamWorksMovies/Start.tscn")


func _on_Button2_button_down():
	$"/root/MenuSong".stop()
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/HowToPlay1.tscn")


func _on_Button3_button_down():
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/Menu.tscn")


func _on_Button4_button_down():
	$"/root/MenuSong".stop()
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://ExtraTheatre/VersusStart.tscn")


func _on_Button5_pressed():
	OS.set_window_size(Vector2(1280, 720))


func _on_Button6_pressed():
	OS.set_window_size(Vector2(960, 720))


func _on_Button7_pressed():
	OS.set_window_size(Vector2(720, 720))



func _on_Button8_toggled(button_pressed):
	if button_pressed == true:
		OS.window_fullscreen = true
	else:
		OS.window_fullscreen = false
