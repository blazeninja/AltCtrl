extends Node2D
const scroll_speed: int = 1
var screen_size: Vector2i
@export var cloudscene : PackedScene
#@export var cloudanim : AnimatedSprite2D
const cloud_delay : int = 100
const cloud_range : int = 200
var clouds: Array


func _ready():
	screen_size = get_window().size
	new_game()
	
func new_game(): 
	clouds.clear()
	generate_clouds()
	$cloudtimer.start()
	
func _process(delta):
	for cloud in clouds: 
		cloud.position.x -= scroll_speed
	
func _on_cloudtimer_timeout():
	generate_clouds()

func generate_clouds():
	var cloud = cloudscene.instantiate()
	
	cloud.position.x = screen_size.x + cloud_delay
	cloud.position.y = randi_range(0, 1000)
	add_child(cloud)
	clouds.append(cloud)



