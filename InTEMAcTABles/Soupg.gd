extends Label

var coin = 0


func sus_the_shiny():
	coin += 1
	$".".text = str(coin) + " x"
