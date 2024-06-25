extends KinematicBody2D

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO
onready var LedgeCheck = $LedgeCheck
onready var LedgeCheck2 = $LedgeCheck2
onready var brite = $AnimatedSprite

# warning-ignore:unused_argument
func _physics_process(delta):
	var found_wall = is_on_wall()
	var found_ledge = not LedgeCheck.is_colliding() or not LedgeCheck2.is_colliding()
	
	if found_wall or found_ledge:
		direction *= -1
	brite.flip_h = direction.x > 0
	$AnimatedSprite.animation = "Run"
	
	velocity = direction * 150
	$AnimatedSprite.animation = "Run"
# warning-ignore:return_value_discarded
	move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if body is MegaRedBall:
		direction.x = 0
		$Area2D.queue_free()
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.visible = false
		$AnimatedSprite2.visible = true
		$AnimatedSprite2.playing = true
		$AnimatedSprite2.frame = 0
		yield($AnimatedSprite2, "animation_finished")
		queue_free()
