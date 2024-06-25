extends Area2D

# warning-ignore:unused_signal
signal stoleCoin

func _on_Area2D_body_entered(body):
	if body is RedBall:
		$AnimatedSprite.play("MrKrabsStoleIt")
		$AudioStreamPlayer2D.play()
		$CollisionShape2D.queue_free()
		$Spikles.stop()
		
	if body is RedBallNightly:
		$AnimatedSprite.play("MrKrabsStoleIt")
		$AudioStreamPlayer2D.play()
		$CollisionShape2D.queue_free()
		$Spikles.stop()
		
	if body is MiniBall:
		$AnimatedSprite.play("MrKrabsStoleIt")
		$AudioStreamPlayer2D.play()
		$CollisionShape2D.queue_free()
		$Spikles.stop()
		
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "MrKrabsStoleIt":
		queue_free()
