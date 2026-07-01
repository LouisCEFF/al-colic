extends Area2D

var is_held = false
var holder = null

func _ready():
	add_to_group("item")

func _process(delta):
	if is_held and holder:
		print(holder.get_node("HoldPosition").global_position)
		global_position = holder.get_node("HoldPosition").global_position

func pick_up(player):
	is_held = true
	holder = player
	$CollisionShape2D.set_deferred("disabled", true)

func drop():
	is_held = false
	holder = null
	$CollisionShape2D.set_deferred("disabled", false)
