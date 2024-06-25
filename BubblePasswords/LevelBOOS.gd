extends Node2D

const MAMAscene = preload ("res://MAMAnimasionsForBuyer/Player.tscn")
var player_minecraft_respawn_be_like = Vector2.ZERO

onready var camera = $Camera2D
onready var player = $Player
onready var timer = $Timer
# I have nothing to say here
func _ready():
	VisualServer.set_default_clear_color(Color.black)
	player.connect_camera(camera)
	player_minecraft_respawn_be_like = player.global_position
# warning-ignore:return_value_discarded
	Events.connect("player_died", self, "_on_player_ded")
# warning-ignore:return_value_discarded
	Events.connect("reach_wiipoint", self, "_on_reach_wiipoint")
	$AudioStreamOOF.play()
	yield($AudioStreamOOF, "finished")
	$AudioStreamPlayer2D.play()
	
	
func _on_reach_wiipoint(wiipoint_pos):
	player_minecraft_respawn_be_like = wiipoint_pos

func _on_player_ded():
	$AudioStreamPlayer2D2.play()
	timer.start(1)
	yield(timer, "timeout")
# warning-ignore:shadowed_variable
	var player = MAMAscene.instance()
	add_child(player)
	player.global_position = player_minecraft_respawn_be_like
	player.connect_camera(camera)
