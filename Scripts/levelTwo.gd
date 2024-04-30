extends Node2D

signal arrow_count_changed(count)

var arrow_count = 10
@onready var target = $TargetProto

func _ready():
	pass
	
func _process(_delta):
	if Global.score >= 15:
		Global.arrowCount = 10
		Global.score = 0
		get_tree().change_scene_to_file("res://Scenes/levelThree.tscn")
