extends Control

@onready var quit_text: RichTextLabel = $QuitText
@onready var quit: Button = $Quit
@onready var bgimg: TextureRect = $"../BGIMG"
@onready var bgimg2: TextureRect = $"../BGIMG2"
@onready var fireplace: Area2D = $Fireplaces/Fireplace
@onready var color_rect: ColorRect = $"../ColorRect"
var clicked : bool = false
func _ready() -> void:
	quit_text.text = "[wave][color=#FFFFFF] Quit ? [/color][/wave]"
	quit.size = Vector2(402.0,79.0)
	quit.position = Vector2(8.0,-39)
		

func _on_retry_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	



func _on_quit_button_down() -> void:
	if clicked == true :
		get_tree().quit()
	quit_text.text = "[wave amp=250][color=#A81F00] Are you sure ? [/color][/wave]"
	quit.size = Vector2i(536.364,79.0)
	quit.position = Vector2(1.0,-39)
	clicked = true
