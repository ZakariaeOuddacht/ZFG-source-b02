extends KinematicBody2D

class_name RedBall
export(int) var JUMP_FORCE = -450
var JUMP_RELEASE_FORCE = -70
export(int) var MAX_SPEED = 350
export(int) var ACCELERATION = 20
export(int) var FRICTION = 20
export(int) var GRAVITY = 12
var ADDITIONNAL_FALL_GRAVITY = 4
var DOUBLE_JUMP_COUNT = 1

# Hack The Player By These Things!
export(String, "None", "Moon Jump", "SPEEDHACK", "No Accel/Friction", "No Double Jump", "Turtle", "Game Crasher", "No Running", "No Jumping", "SLIPPERY!") var PHYSICS_HACKER = "None"
# This is Used For Crasher Hack
export(float) var crasher_delay = 0.0

# This Thing Turns On Those RayCast2Ds
export(bool) var FREAKY_MODE = false
var velocity = Vector2.ZERO
var fast_fell = false
var double_jump = 1
onready var animatedSprite = $AnimatedSprite
onready var remoteTransform2D = $RemoteTransform2D
onready var l_o = $L_o
onready var l_i = $L_i
onready var r_i = $R_i
onready var r_o = $R_o
onready var player = $"."


func _physics_process(_delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if Input.is_action_pressed("ui_run"):
		#animatedSprite.play("WannaBeFast")
		if PHYSICS_HACKER == "No Running":
			MAX_SPEED = 350
		elif PHYSICS_HACKER == "SPEEDHACK":
			MAX_SPEED = 2500
		elif PHYSICS_HACKER == "Turtle":
			MAX_SPEED = 125
		else:
			MAX_SPEED = 500
	else:
		MAX_SPEED = 350

	#if Input.is_action_pressed("ui_run") and input.x:
		#animatedSprite.play("RUN")
	
	if FREAKY_MODE == true:
		$L_o.enabled = true
		$L_i.enabled = true
		$R_i.enabled = true
		$R_o.enabled = true
	else:
		$L_o.enabled = false
		$L_i.enabled = false
		$R_i.enabled = false
		$R_o.enabled = false
	
	# Physics Hacker
	match PHYSICS_HACKER:
		"Moon Jump":
			JUMP_FORCE = -1800
		# "SPEEDHACK":
			# MAX_SPEED = 2500
		"No Accel/Friction":
			ACCELERATION = 2000
			FRICTION = 2000
		"No Double Jump":
			DOUBLE_JUMP_COUNT = 0
			double_jump = 0
		"Turtle":
			MAX_SPEED = 125
		"Game Crasher":
			yield(get_tree().create_timer(crasher_delay), "timeout")
			player_ded()
		"No Jumping":
			JUMP_FORCE = 0
			JUMP_RELEASE_FORCE = 0
			DOUBLE_JUMP_COUNT = 0
			double_jump = 0
		# "No Running":
		"SLIPPERY!":
			ACCELERATION = 5
			FRICTION = 5
	
	
	
	if input.x == 0:
		apply_friction()
		animatedSprite.play("IdleNSleep")
		
	else:
		apply_acceleration(input.x)
		animatedSprite.play("WalkLikeASnail")
		if input.x > 0:
			$AnimatedSprite.flip_h = true
		elif input.x < 0:
			$AnimatedSprite.flip_h = false
		
	if player.r_o.is_colliding() and !player.r_i.is_colliding() \
		and !player.l_i.is_colliding() and !player.l_o.is_colliding():
			player.global_position.x -= 18
	elif player.l_o.is_colliding() and !player.l_i.is_colliding() \
		and !player.r_i.is_colliding() and !player.r_o.is_colliding():
			player.global_position.x += 18
			
		
	if is_on_floor():
		double_jump = DOUBLE_JUMP_COUNT
		fast_fell = false
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_FORCE
			$AudioStreamPlayer2D.play()
	else: 
		$AnimatedSprite.play("JumpingOutOfBunny")
		if Input.is_action_just_released("ui_up") and velocity.y < JUMP_RELEASE_FORCE:
			velocity.y = JUMP_RELEASE_FORCE
			
		if Input.is_action_just_pressed("ui_up") and double_jump > 0:
			velocity.y = JUMP_FORCE
			double_jump -= 1
			$AudioStreamPlayer2D2.play()
			#$AnimatedSprite.play("BubbleJoump")
			$AnimatedSprite.frame = 1
			
		if velocity.y > 10:
			velocity.y += ADDITIONNAL_FALL_GRAVITY
		
	var was_in_air = not is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	var just_landed = is_on_floor() and was_in_air
	if just_landed:
		animatedSprite.play("WalkLikeASnail")
		$AnimatedSprite.frame = 1
	
	
	if was_in_air and is_on_wall():
		GRAVITY = 5
	else:
		GRAVITY = 12
		
	if was_in_air and is_on_ceiling():
		$AudioStreamPlayer2D4.play()
func player_ded():
# warning-ignore:return_value_discarded
	queue_free()
	Events.emit_signal("player_died")
	
func connect_camera(camera):
# warning-ignore:unused_variable
	var camera_path = camera.get_path()
	remoteTransform2D.remote_path = camera_path
	
func apply_gravity():
		velocity.y += GRAVITY
		velocity.y = min(velocity.y, 400)
		
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION)
	
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION)
