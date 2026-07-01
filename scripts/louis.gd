extends CharacterBody2D

var nearby_item = null
var held_item = null


@export var SPEED = 130.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("move_left" , "move_right")
	var directionY := Input.get_axis("move_up", "move_down")
	if directionX == 0 && directionY == 0:
		$AnimatedSprite2D.play("Idle")
	elif directionX != 0  && directionY == 0:
		$AnimatedSprite2D.play("Sprint_Side")
	elif directionX == 0  && directionY < 0:
		$AnimatedSprite2D.play("Sprint_Up")
	elif directionX != 0  && directionY > 0:
		$AnimatedSprite2D.play("Sprint_DDiag")
	elif directionX != 0  && directionY < 0:
		$AnimatedSprite2D.play("Sprint_UDiag")
	else:
		$AnimatedSprite2D.play("Sprint_Down")

	if directionX<0 && directionY<0 || directionX<0 && directionY>0 || directionX<0:
		$AnimatedSprite2D.flip_h = true
	elif directionX>0 && directionY>0 || directionX>0 && directionY<0 || directionX>0 || directionX>0 && directionY>0:
		$AnimatedSprite2D.flip_h = false
	

	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
func _ready():
	$PickupArea.area_entered.connect(_on_area_entered)
	$PickupArea.area_exited.connect(_on_area_exited)

func _on_area_entered(area):
	if area.is_in_group("item") and not area.is_held:
		nearby_item = area

func _on_area_exited(area):
	if area == nearby_item:
		nearby_item = null

func _input(event):
	if event.is_action_pressed("interact"):
		if held_item:
			held_item.drop()
			held_item = null
		elif nearby_item:
			held_item = nearby_item
			held_item.pick_up(self)
			nearby_item = null
