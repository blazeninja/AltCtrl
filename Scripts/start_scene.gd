extends Node2D

func _on_quit_button_pressed():
	get_tree().quit()



func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/levelOne.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
