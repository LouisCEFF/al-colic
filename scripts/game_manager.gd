extends Node2D

var score = 0
@onready var node_2d: Node2D = $"../Node2D"

func add_point():
	score += 1
	$"../CanvasLayer/Label".text = "Jaggers : " + str(score) + "/" + str(node_2d.amount)
	print(score)
