extends CharacterBody2D

@export var SPEED = 200
@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
var chasing : bool = false
@onready var navigation_region_2d: NavigationRegion2D = $"../NavigationRegion2D"
var direction : Vector2
func _ready() -> void:
	await get_tree().physics_frame
	nav_agent.navigation_finished.connect(_on_navigation_agent_2d_navigation_finished)
	_pick_new_partol_point()
	#var next_path_pos = NavigationServer2D.region_get_random_point(navigation_region_2d.get_region_rid(), 1, false)
	#direction = global_position.direction_to(next_path_pos)
	#velocity = direction * SPEED
	#print(direction)
	#move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if chasing == true :
		nav_agent.target_position = player.global_position
		var next_path_pos := nav_agent.get_next_path_position()
		var dir = global_position.direction_to(next_path_pos)
		velocity = dir * SPEED
		look_at(-player.position)
	print("finished: ", nav_agent.is_navigation_finished(), "\n\t target : ", nav_agent.target_position, "\n\t pos: ", global_position)
	if nav_agent.is_navigation_finished():
		return
	move_and_slide()
	#if chasing == false:
		#var next_path_pos = NavigationServer2D.region_get_random_point(navigation_region_2d.get_region_rid(), 1, false)
		#direction = global_position.direction_to(next_path_pos)
		#velocity = direction * SPEED
		#print(next_path_pos)
		#move_and_slide()
#region
#func makePath() -> void:
	#if chasing == false :
		#var dir = NavigationServer2D.region_get_random_point(navigation_region_2d.get_rid(), 1, false)
		#nav_agent.target_position = global_position.direction_to(dir)
	#else :
		#nav_agent.target_position = player.global_position
	##elif nav_agent.target_position.x > 0:
		##$".".rotate(-180)
	#
	##if $CharacterContainer/RayCastLeft.is_colliding():
		##$CharacterContainer/Body.rotation = 0
		###$Left.visible = false
		###$KillZone/LR.disabled = true
		###$KillZone/LL.disabled = true
		###$KillZone/RL.disabled = false
		###$KillZone/RR.disabled = false
		###$Right.visible = true
		##direction = 1
		##print("test")
	##if $CharacterContainer/RayCastRight.is_colliding():
		##$CharacterContainer/Body.rotation = 180
		###$Left.visible = true
		###$KillZone/LR.disabled = false
		###$KillZone/LL.disabled = false
		###$KillZone/RL.disabled = true
		###$KillZone/RR.disabled = true
		###$Right.visible = false
		##direction = -1
		##print("test")
	##position.x += direction * SPEED * delta
func _pick_new_partol_point() -> void:
	var newdir = NavigationServer2D.region_get_random_point(navigation_region_2d.get_region_rid(), 1 ,false)
	nav_agent.target_position = newdir
	var dir = global_position.direction_to(newdir)
	velocity = dir * SPEED
	move_and_slide()

#func _on_timer_timeout() -> void:
	#if nav_agent.target_position != player.global_position:
		#nav_agent.target_position = player.global_position
	#
	#makePath()


func _on_aggro_range_body_entered(body: Node2D) -> void:
	chasing = true
	print(body.name + "on")


func _on_aggro_range_body_exited(body: Node2D) -> void:
	chasing = false
	print(body.name + "off")
	_pick_new_partol_point()


func _on_navigation_agent_2d_navigation_finished() -> void:
	if not chasing:
		_pick_new_partol_point()
