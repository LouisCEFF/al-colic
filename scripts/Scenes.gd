extends Node

var previous_scene_path: String = ""

# A custom function to handle transitions safely
func go_to_scene(target_scene_path: String):
	# Record the current scene before we lose it
	previous_scene_path = get_tree().current_scene.scene_file_path
	
	# Change to the new scene
	get_tree().change_scene_to_file(target_scene_path)
