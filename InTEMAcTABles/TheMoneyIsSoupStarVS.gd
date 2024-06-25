extends Area2D

onready var rich_text_label = $"../HUD/RichTextLabel"
onready var rich_text_label_2 = $"../HUD/RichTextLabel2"


func _ready():
	$Timer.start(30.0)
	yield($Timer, "timeout")
	queue_free()


func _on_StarCoin_body_entered(body):
	if body is RedBall:
		rich_text_label.sus_the_shiny()
		$Spikles.queue_free()
		$CollisionShape2D.queue_free()
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.play("MrKrabsStoleIt")
		yield($AnimatedSprite, "animation_finished")
		queue_free()
	elif body is GoldenBall:
		rich_text_label_2.sus_the_shiny()
		$Spikles.queue_free()
		$CollisionShape2D.queue_free()
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.play("MrKrabsStoleIt")
		yield($AnimatedSprite, "animation_finished")
		queue_free()
	else: return
