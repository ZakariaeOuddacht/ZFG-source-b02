extends Node2D

enum {HOVER, FALL, LAND, RISE}

var state = HOVER

onready var start_pos = global_position
onready var raycast3 = $RayCast2D3
onready var raycast2 = $RayCast2D2
onready var raycast = $RayCast2D
onready var timer = $Timer

func _physics_process(delta):
	match state:
		HOVER: hover_state()
		FALL: fall_state(delta)
		LAND: land_state()
		RISE: rise_state(delta)
		
func hover_state():
	state = FALL
	$Timer2.start(1.5)
	yield($Timer2, "timeout")
func fall_state(delta):
	$AnimatedSprite.play("BOOM")
	position.y += 300 * delta
	if raycast.is_colliding():
		var collision_point = raycast.get_collision_point()
		position.y = collision_point.y
		state = LAND
		timer.start(1.0)
	if raycast2.is_colliding():
		var collision_point = raycast2.get_collision_point()
		position.y = collision_point.y
		state = LAND
		timer.start(1.0)
	if raycast3.is_colliding():
		var collision_point = raycast3.get_collision_point()
		position.y = collision_point.y
		state = LAND
		timer.start(1.0)
		
func land_state():
		yield(timer, "timeout")
		state = RISE
	
func rise_state(delta):
	$AnimatedSprite.play("zzzZZZZzzz")
	position.y = move_toward(position.y, start_pos.y, 100 * delta)
	if position.y == start_pos.y:
		state = HOVER
