extends CharacterBody2D


const SPEED = 300.0

var bow_equipped = true
var bow_cooldown = true
var arrow = preload("res://Scenes/arrow.tscn")
var arrow_count = 10
@export var arrow_shot_sound: AudioStreamPlayer
@export var bow_draw_sound: AudioStreamPlayer

@warning_ignore("unused_parameter")
func _physics_process(delta):
	
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
		arrow_count-= 1

		
		#Update UI
		#var arrow_label = get_node("/root/LevelOne/CanvasLayer/Arrows")
		#arrow_label.text = str(arrow_count)
		
		print($Timer.time_left)

		await get_tree().create_timer(0.4).timeout
		bow_cooldown = true
