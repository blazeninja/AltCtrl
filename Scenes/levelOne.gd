extends Node2D
const scroll_speed: int = 1
var screen_size: Vector2i
@export var cloudscene : PackedScene
const cloud_delay : int = 100
const cloud_range : int = 200
var clouds: Array

func _ready():
	screen_size = get_window().size
	
#func _process(delta):
	#for cloud in clouds: 
		#cloud.position.x -= scroll_speed
	
func _on_cloud_timer_timeout():
	generate_clouds()
	
func generate_clouds():
	var cloud = cloudscene.instantiate()
	#cloud.position.x = screen_size.x 
	#cloud.position.y = screen_size.y / 2 + randi_range(-cloud_range, cloud_range)
	add_child(cloud)
	clouds.append(cloud)
	cloud.get_node("cloudtimer").start()
