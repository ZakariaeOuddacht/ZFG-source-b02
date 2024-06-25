extends Node2D

# Preload the StarCoin scene
const STAR_COIN_SCENE = preload("res://InTEMAcTABles/TheMoneyIsSoupStarVS.tscn")
const MAMAscene = preload("res://MAMAnimasionsForBuyer/Player.tscn")
const MAMAscen = preload("res://MAMAnimasionsForBuyer/Player2.tscn")
var player_minecraft_respawn_be_like = Vector2.ZERO
var player_minecraft_respawn_be_like2 = Vector2.ZERO

onready var camera = $"Camera2D"
onready var camera2 = $"Camera2D"
onready var player = $Player
onready var player2 = $Player2
onready var timer = $Timer


func _ready():
	VisualServer.set_default_clear_color(Color.turquoise)
	player.connect_camera(camera)
	player_minecraft_respawn_be_like = player.global_position
	player2.connect_camera(camera2)
	player_minecraft_respawn_be_like2 = player2.global_position
# warning-ignore:return_value_discarded
	Events.connect("player_died", self, "_on_player_ded")
# warning-ignore:return_value_discarded
	Events.connect("player2_died", self, "_on_player2_ded")
# warning-ignore:return_value_discarded
	Events.connect("reach_wiipoint", self, "_on_reach_wiipoint")
	
# Start the timer to spawn star coins
	spawn_star_coin()

# Did you Know That The Game Will Be Co-op Multiplayer in Early Days?
# I made Golden Ball Real in Versus Mode, bye.
func _process(_delta):
	if $HUD/RichTextLabel.coin > 8 or $HUD/RichTextLabel2.coin > 8:
		$Loop.pitch_scale = 1.1
		$Start.pitch_scale = 1.1
	elif $HUD/RichTextLabel.coin > 7 or $HUD/RichTextLabel2.coin > 7:
		$Loop.pitch_scale = 1.05
		$Start.pitch_scale = 1.05
	else:
		$Loop.pitch_scale = 1
		$Start.pitch_scale = 1
	
	if $HUD/RichTextLabel.coin == 10:
		get_tree().paused = true
		get_node("HUD/Label").visible = true
		$Finish.play()
		yield(get_tree().create_timer(5.0), "timeout")
		Transisforms.play_exit_trans()
		get_tree().paused = true
		yield(Transisforms, "trans_completed")
		Transisforms.play_enter_trans()
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://ExtraTheatre/Menu.tscn")
		
	if $HUD/RichTextLabel2.coin == 10:
		get_tree().paused = true
		get_node("HUD/Label2").visible = true
		$Finish.play()
		yield(get_tree().create_timer(5.0), "timeout")
		Transisforms.play_exit_trans()
		get_tree().paused = true
		yield(Transisforms, "trans_completed")
		Transisforms.play_enter_trans()
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://ExtraTheatre/Menu.tscn")
	
func _on_reach_wiipoint(wiipoint_pos):
	player_minecraft_respawn_be_like = wiipoint_pos
	player_minecraft_respawn_be_like2 = wiipoint_pos
	

func _on_player_ded():
	$AudioStreamPlayer2D2.play()
	$Timer.start(0.5)
	yield($Timer, "timeout")
# warning-ignore:shadowed_variable
	var player = MAMAscene.instance()
	add_child(player)
	player.global_position = player_minecraft_respawn_be_like
	player.connect_camera(camera)
	
func _on_player2_ded():
	$AudioStreamPlayer2D2.play()
	$Timer.start(0.5)
	yield($Timer, "timeout")
# warning-ignore:shadowed_variable
	var player2 = MAMAscen.instance()
	$".".add_child(player2)
	player2.global_position = player_minecraft_respawn_be_like2
	player2.connect_camera(camera2)



func _on_Start_finished():
	$Loop.play()

func spawn_star_coin():
	# Define positions
	var positions = [
		Vector2(1792, -192),
		Vector2(-1536, -640),
		Vector2(-1920, -64),
		Vector2(320, -192),
		Vector2(1920, -640)
	]
	
	# Shuffle the positions array to spawn star coins randomly
	positions.shuffle()
	
	# Get the first position from the shuffled array
	var position = positions[0]
	
	# Instance the StarCoin scene at the chosen position
	var star_coin = STAR_COIN_SCENE.instance()
	star_coin.position = position
	add_child(star_coin)
	
	# Wait for 30 seconds before spawning the next star coin
	yield(get_tree().create_timer(30.0), "timeout")
	spawn_star_coin()


func _on_Button_pressed():
		$Quit.play()
		Transisforms.play_exit_trans()
		get_tree().paused = true
		yield(Transisforms, "trans_completed")
		Transisforms.play_enter_trans()
		get_tree().paused = false
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://ExtraTheatre/Menu.tscn")
	
# L is Real 2401
