extends CharacterBody2D

const SPEED = 300.0

var bow_equipped = true
var bow_cooldown = true
var arrow = preload("res://Scenes/arrow.tscn")
var arrow_count = 10
@export var arrow_shot_sound: AudioStreamPlayer
@export var bow_draw_sound: AudioStreamPlayer

func _physics_process(_delta):
	#Arrow shooting script
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("shoot_arrow") and arrow_count >= 1:
		$Timer.start(1)
		bow_draw_sound.play()
	
	if Input.is_action_just_released("shoot_arrow") and bow_equipped and bow_cooldown and arrow_count >= 1:
		bow_cooldown = false
		var arrow_instance = arrow.instantiate()
		arrow_instance.rotation = $Marker2D.rotation
		arrow_instance.global_position = $Marker2D.global_position
		arrow_instance.time_left = $Timer.time_left
		add_child(arrow_instance)
		arrow_shot_sound.play()

		Global.arrowCount -= 1
		arrow_count -= 1

		
		#Update UI
		#var arrow_label = get_node("/root/LevelOne/CanvasLayer/Arrows")
		#arrow_label.text = str(arrow_count)
		
		print($Timer.time_left)

		await get_tree().create_timer(0.4).timeout
		bow_cooldown = true


func _on_target_proto_area_entered(area):
	var distance_from_center = position.distance_to(arrow)
		
	if distance_from_center <= 15:
		Global.score += 10
	if distance_from_center >= 15 and distance_from_center <= 31:
		Global.score += 5
	if distance_from_center >= 31 and distance_from_center <= 55:
		Global.score += 3
	if distance_from_center >= 55 and distance_from_center <= 80:
		Global.score += 2
	if distance_from_center >= 80 and distance_from_center <= 98:
		Global.score += 1
