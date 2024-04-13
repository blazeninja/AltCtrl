extends Button


func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
