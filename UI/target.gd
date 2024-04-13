extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var distance_from_center = position.distance_to(event.position)
		
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
