extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("you died")

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area.is_in_group("item"):
		$"../../GameManager".add_point()
		area.queue_free()
