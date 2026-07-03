extends Area2D

@export var speed := 100.0

func _physics_process(delta):
	for body in get_overlapping_bodies():
		body.position.y -= speed * delta
	for area in get_overlapping_areas():
		if area.is_in_group("item") and not area.is_held:
			area.position.y -= speed * delta
		elif area.is_in_group("candles") and not area.is_held:
			area.position.y -= speed * delta
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			body.velocity.y -= speed
		else:
			body.position.y -= speed * delta
