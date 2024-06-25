extends Node

onready var StreamPlayer = $BingoBuyers/AudioStreamPlayer

func play_sound():
	StreamPlayer.play()
