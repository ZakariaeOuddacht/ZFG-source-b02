extends Path2D


func _ready():
	pass


func _on_Area2D_body_entered(body):
	if body is RedBall:
		$PathFollow2D/idk/HitBoux.queue_free()
		$PathFollow2D/idk/Area2D.queue_free()
		$DED.play()
		$PathFollow2D/idk/AnimatedSprite.play("Died")
		yield($PathFollow2D/idk/AnimatedSprite, "animation_finished")
		queue_free()
