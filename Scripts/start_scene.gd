extends Node2D

@export var buttonsound: AudioStreamPlayer
@export var buttondelay: Timer

func _on_quit_button_pressed():
	get_tree().quit()



func _on_start_button_pressed():
	buttonsound.play()
	buttondelay.start()

func _on_buttondelay_timeout():
	get_tree().change_scene_to_file("res://Scenes/Lore.tscn")
