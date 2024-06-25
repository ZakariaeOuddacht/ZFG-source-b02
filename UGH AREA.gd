extends Area2D

export(String, FILE, "*.tscn") var target_level_path = ""

func _on_SUB_AREA_body_entered(body):
	if not body is MiniBall: return
	if target_level_path.empty(): return
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene(target_level_path)
