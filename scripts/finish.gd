extends Area2D

@onready var game_manager = $"../GameManager"
@onready var spawner = $"../Node2D"

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if game_manager.score >= spawner.amount:
			get_tree().change_scene_to_file("res://scenes/WinScreen.tscn")
		else:
			var left = spawner.amount - game_manager.score
			$"../CanvasLayer/Label".text =  str(left) + " Bottles left!"
