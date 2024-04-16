extends Area2D
var speed = 500
var time_left = null

func _ready():
	set_as_top_level(true)

func _process(delta):
	time_left = time_left - delta
	if time_left <= 0:
		queue_free()
	else:
		position += (Vector2.RIGHT*speed).rotated(rotation) * delta

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	queue_free()
