extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("you died")
	GameData.fire = false
	get_tree().change_scene_to_file("res://scenes/jumpscare.tscn")
