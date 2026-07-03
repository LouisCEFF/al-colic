extends Node2D

@export var jagger_scene: PackedScene
@export var min_jagger:int
@export var max_jagger:int
@export var candle_scene: PackedScene
@export var min_candles:= 10
@export var max_candles:= 15
var amount : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_jagger()
	spawn_candles()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_jagger():
	var spawn_points = get_tree().get_nodes_in_group("spawn_point")
	print("spawn points: ", spawn_points.size())
	
	amount = randi_range(min_jagger, max_jagger)
	
	spawn_points.shuffle()
	
	for i in range(min(amount, spawn_points.size())):
		var jagger = jagger_scene.instantiate()
		get_parent().call_deferred("add_child", jagger)
		jagger.global_position = spawn_points[i].global_position
		print("spawned jagger at:" , jagger.global_position)
		
func spawn_candles():
	var spawn_points = get_tree().get_nodes_in_group("candles")
	#print("spawn points: ", spawn_points.size())
	
	var amountCandles = randi_range(min_candles, max_candles)
	
	spawn_points.shuffle()
	
	for i in range(min(amountCandles, spawn_points.size())):
		var candle = candle_scene.instantiate()
		get_parent().call_deferred("add_child", candle)
		candle.global_position = spawn_points[i].global_position
		#print("spawned jagger at:" , jagger.global_position)
