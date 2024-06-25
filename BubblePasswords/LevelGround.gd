extends Node2D

const MAMAscene = preload ("res://MAMAnimasionsForBuyer/Player.tscn")
const MAMAscen = preload("res://MAMAnimasionsForBuyer/Player2.tscn")
var player_minecraft_respawn_be_like = Vector2.ZERO
var player2_minecraft_respawn_be_like = Vector2.ZERO
var phy_state = "None"
var phy_state2 = "None"

onready var camera = $Camera2D
onready var player = $Player
onready var timer = $Timer

func _ready():
	VisualServer.set_default_clear_color(Color.turquoise)
	player.connect_camera(camera)
	player_minecraft_respawn_be_like = player.global_position
# warning-ignore:return_value_discarded
	Events.connect("player_died", self, "_on_player_ded")
# warning-ignore:return_value_discarded
	Events.connect("player2_died", self, "_on_player2_ded")
# warning-ignore:return_value_discarded
	Events.connect("reach_wiipoint", self, "_on_reach_wiipoint")
	phy_state = player.PHYSICS_HACKER
		
	
func _on_reach_wiipoint(wiipoint_pos):
	player_minecraft_respawn_be_like = wiipoint_pos
	player2_minecraft_respawn_be_like = wiipoint_pos
# Did you know that Every Level has 32 Coins except Level 6, 7 and 16?

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

func _on_player_ded():
	$AudioStreamPlayer2D2.play()
	timer.start(1)
	yield(timer, "timeout")
# warning-ignore:shadowed_variable
	var player_ins = MAMAscene.instance()
	add_child(player_ins)
	player_ins.PHYSICS_HACKER = phy_state
	player_ins.global_position = player_minecraft_respawn_be_like
	player_ins.connect_camera(camera)
	
func _on_player2_ded():
	$AudioStreamPlayer2D2.play()
	timer.start(1)
	yield(timer, "timeout")
# warning-ignore:shadowed_variable
	var player2 = MAMAscen.instance()
	$".".add_child(player2)
	player2.global_position = player2_minecraft_respawn_be_like
