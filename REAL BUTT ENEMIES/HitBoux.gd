extends Area2D

func _on_HitBoux_body_entered(body):
	if body is RedBall:
# warning-ignore:return_value_discarded
		body.player_ded()

	if body is RedBallNightly:
# warning-ignore:return_value_discarded
		body.player_ded()
		
	if body is GoldenBall:
# warning-ignore:return_value_discarded
		body.player2_ded()
		
	if body is MiniBall:
# warning-ignore:return_value_discarded
		body.player_ded()
	
