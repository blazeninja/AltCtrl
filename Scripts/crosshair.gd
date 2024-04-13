extends CharacterBody2D

func _physics_process(delta) :
	var vel : Vector2 =  (get_viewport().get_mouse_position() - global_position)
	velocity = vel *2.5
	move_and_slide()
