extends Node2D

const MAMAscene = preload ("res://MAMAnimasionsForBuyer/Player.tscn")
var player_minecraft_respawn_be_like = Vector2.ZERO

onready var camera = $Camera2D
onready var player = $Mega

# Did you Know That if You Fall While Ur Mega Red Ball, You'll be Softlocked

func _ready():
	VisualServer.set_default_clear_color(Color.turquoise)
	player.connect_camera(camera)
	player_minecraft_respawn_be_like = player.global_position
# warning-ignore:return_value_discarded
	Events.connect("reach_wiipoint", self, "_on_reach_wiipoint")
	
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


func _on_SUS1_body_entered(body):
	if body is MegaRedBall:
		$AudioStreamPlayer2D2.pitch_scale = 1


func _on_SUS2_body_entered(body):
	if body is MegaRedBall:
		$AudioStreamPlayer2D2.pitch_scale = 1.1


func _on_SUS3_body_entered(body):
	if body is MegaRedBall:
		$AudioStreamPlayer2D2.pitch_scale = 1.2
