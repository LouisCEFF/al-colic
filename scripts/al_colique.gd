extends Node2D

@export var SPEED = 90
var direction = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if $RayCastLeft.is_colliding():
		$CharacterContainer/Body.rotate(180)
		#$Left.visible = false
		#$KillZone/LR.disabled = true
		#$KillZone/LL.disabled = true
		#$KillZone/RL.disabled = false
		#$KillZone/RR.disabled = false
		#$Right.visible = true
		direction = 1
		print("test")
	if $RayCastRight.is_colliding():
		$CharacterContainer/Body.rotate(180)
		#$Left.visible = true
		#$KillZone/LR.disabled = false
		#$KillZone/LL.disabled = false
		#$KillZone/RL.disabled = true
		#$KillZone/RR.disabled = true
		#$Right.visible = false
		direction = -1
		print("test")
	position.x += direction * SPEED * delta
