extends Area2D


var speed = 500
var time_left = null

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_left = time_left - delta
	if time_left <= 0:
		$Timer.start(.4)
	else:
		position += (Vector2.RIGHT*speed).rotated(rotation) * delta
		#var power = get_node("/root/LevelOne/CanvasLayer2/ProgressBar").value
		#power = time_left * 100
		await get_tree().create_timer(2).timeout
		queue_free()

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	#queue_free()
	pass


func _on_timer_timeout():
	self.queue_free()

#func _on_power():
	#pass # Replace with function body.
