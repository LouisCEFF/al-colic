extends Node2D

@onready var jumpscare: AnimatedSprite2D = $"JumpscareFrame"
@onready var timer: Timer = $Timer


func _ready() -> void:
	if GameData.fire == true:
		jumpscare.animation = "Fire"
		jumpscare.scale = Vector2(4.161,5.777)
		jumpscare.position = Vector2(0.0,-476.935)
		timer.wait_time = 1.0
	elif GameData.fire == false:
		jumpscare.animation = "Loïc"
		jumpscare.scale = Vector2(0.093,0.129)
		jumpscare.position = Vector2(0.998,52.309)
		timer.wait_time = 3.0
		for i in 50:
			await get_tree().create_timer(0.001).timeout
			jumpscare.scale += Vector2(0.1,0.1)
			

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
