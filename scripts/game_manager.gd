extends Node2D

var score = 0

func add_point():
	score += 1
	
	$"../CanvasLayer/Label".text = "Jaggers : " + str(score) + "/ "
	print(score)
