extends Area2D

export(String, FILE, "*.tscn") var target_level_path = ""

var over_buyer = false

func go_to_next_lemon():
		Transisforms.play_exit_trans()
		get_tree().paused = true
		yield(Transisforms, "trans_completed")
		Transisforms.play_enter_trans()
		get_tree().paused = false
	# warning-ignore:return_value_discarded
		get_tree().change_scene(target_level_path)
		
		
# warning-ignore:unused_argument
func _process(delta):
	if over_buyer:
		if Input.is_action_just_pressed("ui_door"):
			if target_level_path.empty(): return
			go_to_next_lemon()

func _on_Bab_body_entered(body):
	if body is RedBall:
		over_buyer = true
	if body is RedBallNightly:
		over_buyer = true
	if body is GoldenBall:
		over_buyer = true
func _on_Bab_body_exited(body):
	if body is RedBall:
		over_buyer = false
	if body is RedBallNightly:
		over_buyer = false
	if body is GoldenBall:
		over_buyer = false
