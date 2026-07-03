extends Area2D

var is_held = false
var holder = null

func _ready():
	add_to_group("candles")

func _process(delta):
	if is_held and holder:
		global_position = holder.get_node("HoldPosition").global_position

func pick_up(player):
	is_held = true
	holder = player
	$CollisionShape2D.set_deferred("disabled", true)

func drop():
	is_held = false
	holder = null
	$CollisionShape2D.set_deferred("disabled", false)

func burnCandle():
	queue_free()
	
func _push(speed: float, push_speed: float) -> float:
	if push_speed >= 0.0:
		if speed >= 0.0:
			return max(speed, push_speed)
	elif speed < 0.0:
		return min(speed, push_speed)
	return speed + push_speed
	
