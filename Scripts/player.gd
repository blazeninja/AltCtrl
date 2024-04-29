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
		#print($Timer.time_left)

		await get_tree().create_timer(1).timeout
		bow_cooldown = true
		var arrow_position = arrow_instance.position
		target_score(arrow_position)
		print(get_tree().current_scene.name)
		
		if get_tree().get_current_scene().get_name() == "LevelThree":
			small_target_score(arrow_position)


func target_score(arrow_position):
	var target = get_tree().get_first_node_in_group("Controller").target
	
	
	print(target.position)
	print(arrow_position)
	
	var diff = arrow_position - target.position
	print(diff)
	var diff_length = diff.length()
	print(diff_length)
	
	if diff_length <= 15:
		Global.score += 10
	if diff_length >= 15 and diff_length <= 31:
		Global.score += 5
	if diff_length >= 31 and diff_length <= 55:
		Global.score += 3
	if diff_length >= 55 and diff_length <= 80:
		Global.score += 2
	if diff_length >= 80 and diff_length <= 98:
		Global.score += 1

func small_target_score(arrow_position):
	var target2 = get_tree().get_first_node_in_group("Controller").target2
	if target2 != null:
		print(arrow_position)
		var diff = arrow_position - target2.position
		print(diff)
		var diff_length = diff.length()
		print(diff_length)
		if diff_length <= 3:
			Global.score += 4
		if diff_length >= 3 and diff_length <= 12:
			Global.score += 3
		if diff_length >= 12 and diff_length <= 24:
			Global.score += 2
		if diff_length >= 24 and diff_length <= 39:
			Global.score += 1
	else: 
		if target2 == null: pass
