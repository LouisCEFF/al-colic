extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("you died")
	GameData.fire = true
	get_tree().change_scene_to_file("res://scenes/jumpscare.tscn")

func _ready():
	add_to_group("fireplace")
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area.is_in_group("item"):
		$"../../GameManager".add_point()
		area.queue_free()
	elif area.is_in_group("candles"):
		area.queue_free()
