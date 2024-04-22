extends Button

@export var buttonsound: AudioStreamPlayer
@export var buttondelay: Timer

func _on_pressed():
	buttonsound.play()
	buttondelay.start()
	get_node("/root/Global").arrowCount = 10
	
func _on_buttondelay_timeout():
	get_tree().change_scene_to_file("res://Scenes/levelOne.tscn")
