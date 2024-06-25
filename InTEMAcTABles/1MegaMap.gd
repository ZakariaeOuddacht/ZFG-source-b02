extends StaticBody2D


func _ready():
	pass


func _on_Area2D_body_entered(body):
	if body is MegaRedBall:
		$AnimatedSprite.play("AAAAAAAAAAAA")
		$AudioStreamPlayer2D.play()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "AAAAAAAAAAAA":
		queue_free()
