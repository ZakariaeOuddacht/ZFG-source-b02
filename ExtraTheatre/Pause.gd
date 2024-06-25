extends Control


func _input(event):
	if event.is_action_pressed("ui_accept"):
		$AudioStreamPlayer2D.play()
		var new_pause_bite = not get_tree().paused
		get_tree().paused = new_pause_bite
		visible = new_pause_bite
	
