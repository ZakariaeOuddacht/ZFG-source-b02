extends Area2D

var active = true

func _on_WiiMoint_body_entered(body):
	if not body is  RedBall: return
	if not active: return
	active = false
	Events.emit_signal("reach_wiipoint", position)
	
