extends Label

@onready var node_2d: Node2D = $"../../Node2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Jaggers : 0/" + str(node_2d.amount) 
