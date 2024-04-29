extends Node2D
const scroll_speed: int = 1
var screen_size: Vector2i
@export var cloudscene : PackedScene
const cloud_delay : int = 3
const cloud_range : int = 200
var clouds: Array
@onready var target = $TargetProto
@onready var target2 = $Smalls

func _ready():
	screen_size = get_window().size
	clouds.clear()
	#generate_cloud()
	
func _process(_delta):
	for cloud in clouds: 
		cloud.position.x -= scroll_speed
		if(cloud.position.x <= -100):
			cloud.queue_free()
			clouds.remove_at(0)
#
#func generate_cloud():
	#var cloud = cloudscene.instantiate()
	#cloud.position.x = screen_size.x + cloud_delay
	#cloud.position.y = randi_range(0, 1000)
	#cloud.set_frame(randi_range(0,2))
	#add_child(cloud)
	#clouds.append(cloud)
	#await get_tree().create_timer(cloud_delay).timeout
	#generate_cloud()
