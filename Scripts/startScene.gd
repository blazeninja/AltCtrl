extends Node2D


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/levelOne.tscn")


func _on_button_2_pressed():
	get_tree().quit()
