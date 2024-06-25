extends KinematicBody2D

class_name MegaRedBall
export(int) var JUMP_FORCE = -450
export(int) var JUMP_RELEASE_FORCE = -70
export(int) var MAX_SPEED = 250
export(int) var ACCELERATION = 20
export(int) var FRICTION = 20
export(int) var GRAVITY = 15
export(int) var ADDITIONNAL_FALL_GRAVITY = 4
export(int) var DOUBLE_JUMP_COUNT = 1
var velocity = Vector2.ZERO
var fast_fell = false
var double_jump = 1
onready var animatedSprite = $AnimatedSprite
onready var remoteTransform2D = $RemoteTransform2D
onready var audioStreamPlayer = $AudioStreamPlayer

# warning-ignore:unused_argument
func _physics_process(delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input.x == 0:
		apply_friction()
		animatedSprite.play("Idle")
		
	else:
		apply_acceleration(input.x)
		animatedSprite.play("Run")
		if input.x > 0:
			$AnimatedSprite.flip_h = true
		elif input.x < 0:
			$AnimatedSprite.flip_h = false
		
	if is_on_floor():
		double_jump = DOUBLE_JUMP_COUNT
		fast_fell = false
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_FORCE
			$AudioStreamPlayer2D.play()
	else: 
		$AnimatedSprite.play("Jump")
		if Input.is_action_just_released("ui_up") and velocity.y < JUMP_RELEASE_FORCE:
			velocity.y = JUMP_RELEASE_FORCE
			
		if Input.is_action_just_pressed("ui_up") and double_jump > 0:
			velocity.y = JUMP_FORCE
			double_jump -= 1
			$AudioStreamPlayer2D2.play()
			$AnimatedSprite.play("Jump")
			$AnimatedSprite.frame = 1
			
		if velocity.y > 10:
			velocity.y += ADDITIONNAL_FALL_GRAVITY
		
	var was_in_air = not is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	var just_landed = is_on_floor() and was_in_air
	if just_landed:
		animatedSprite.play("Run")
		$AnimatedSprite.frame = 1
		
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
