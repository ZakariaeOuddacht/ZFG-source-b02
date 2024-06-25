extends Node2D

const MAMAscene = preload ("res://MAMAnimasionsForBuyer/Player.tscn")
var player_minecraft_respawn_be_like = Vector2.ZERO

onready var camera = $Camera2D
onready var player = $Player
onready var timer = $Timer
export(float) var time = 0.00

func _ready():
	VisualServer.set_default_clear_color(Color.turquoise)
	player.connect_camera(camera)
	player_minecraft_respawn_be_like = player.global_position
# warning-ignore:return_value_discarded
	Events.connect("player_died", self, "_on_player_ded")
# warning-ignore:return_value_discarded
	Events.connect("reach_wiipoint", self, "_on_reach_wiipoint")
	$Timer2.start(time)
	yield($Timer2, "timeout")
	$HuhNo.play()
	Transisforms.play_exit_trans()
	get_tree().paused = true
	yield(Transisforms, "trans_completed")
	Transisforms.play_enter_trans()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	
	
func _process(_delta):
	if Input.is_action_pressed("ui_retry_input1"):
# warning-ignore:return_value_discarded
		Transisforms.play_exit_trans()
		get_tree().paused = true
		yield(Transisforms,"trans_completed")
# warning-ignore:return_value_discarded
		get_tree().paused = false
		get_tree().reload_current_scene()
		Transisforms.play_enter_trans()

func _on_reach_wiipoint(wiipoint_pos):
	player_minecraft_respawn_be_like = wiipoint_pos

# Did you know That the Speedrun On my Game is Too Bad?

func _on_player_ded():
	$AudioStreamPlayer2D2.play()
	timer.start(1)
	yield(timer, "timeout")
# warning-ignore:shadowed_variable
	var player = MAMAscene.instance()
	add_child(player)
	player.global_position = player_minecraft_respawn_be_like
	player.connect_camera(camera)
