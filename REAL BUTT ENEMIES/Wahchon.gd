extends KinematicBody2D

onready var player = $"../Player"
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
	if body is RedBall or body is RedBallNightly or body is GoldenBall or body is MiniBall:
		direction.x = 0
		$HitBoux.queue_free()
		$Area2D.queue_free()
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.visible = false
		$AnimatedSprite2.visible = true
		$AnimatedSprite2.play("Died")
		yield($AnimatedSprite2, "animation_finished")
		queue_free()
	
