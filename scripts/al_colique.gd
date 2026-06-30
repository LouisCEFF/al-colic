extends CharacterBody2D

@export var SPEED = 60
var direction = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCastLeft.is_colliding():
		$Sprite2D.flip_h = true
		direction = 1
		print("test")
	if $RayCastRight.is_colliding():
		$Sprite2D.flip_h = false
		direction = -1
		print("test")
	position.x += direction * SPEED * delta
