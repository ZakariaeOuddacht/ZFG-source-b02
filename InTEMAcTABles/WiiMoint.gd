extends Area2D

var active = true


func _sussing_it():
	$AnimatedSprite.play("Chicken")
	$AudioStreamPlayer2D.play()
	active = false
	Events.emit_signal("reach_wiipoint", position)

func _on_WiiMoint_body_entered(body):
	if body is RedBall and active:
		_sussing_it()
	if body is RedBallNightly and active:
		_sussing_it()
	if body is GoldenBall and active:
		_sussing_it()
	if body is MiniBall and active:
		_sussing_it()
