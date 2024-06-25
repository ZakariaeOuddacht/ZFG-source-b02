extends Label

var coin = 0

func _ready():
	if $".".coin == 5:
		get_tree().paused = true
		get_parent().get_node("Label").visible = true
		yield(get_tree().create_timer(5.0), "timeout")
		Transisforms.play_exit_trans()
		get_tree().paused = true
		yield(Transisforms, "trans_completed")
		Transisforms.play_enter_trans()
		get_tree().paused = false
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://ExtraTheatre/Menu.tscn")
	

func sus_the_shiny():
	coin += 1
	$".".text = "x " + str(coin)
