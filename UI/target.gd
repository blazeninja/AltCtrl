extends Area2D
var arrow = preload("res://Scenes/arrow.tscn")
var speed = Vector2(0, 200)
var random = RandomNumberGenerator.new()

func _process(delta):
	position += speed.rotated(rotation)*delta
	

#func _on_input_event(_viewport, event, _shape_idx):
	#if event is InputEventMouseButton and event.pressed:
		#var distance_from_center = position.distance_to(event.position)
		#
		#if distance_from_center <= 15:
			#Global.score += 10
		#if distance_from_center >= 15 and distance_from_center <= 31:
			#Global.score += 5
		#if distance_from_center >= 31 and distance_from_center <= 55:
			#Global.score += 3
		#if distance_from_center >= 55 and distance_from_center <= 80:
			#Global.score += 2
		#if distance_from_center >= 80 and distance_from_center <= 98:
			#Global.score += 1

func _on_area_entered(area):
	#print("Hello World")
	pass


func _on_wall_area_entered(area):
	speed = -speed
	rotation_degrees += random.randi_range(-90, 0)
