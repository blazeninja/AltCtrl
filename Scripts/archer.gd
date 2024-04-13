extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var speed = 7
var acceleration = 50
var jump = 10

var damage = 100

var mouse_sensitivity = 0.3

var direction = Vector3()
#var velocity = Vector3()
var fall = Vector3() 

@onready var head = $head
@onready var aimcast = $head/Camera3D/RayCast3D
@onready var muzzle = $head/gun/muzzle
@onready var bullet = preload("res://scenes/arrow.tscn")



func _ready():
	pass
	
func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity)) 
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sensitivity)) 
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	
	direction = Vector3()

	if Input.is_action_just_pressed("shoot"):
		if aimcast.is_colliding():
			var b = bullet.instantiate()
			muzzle.add_child(b)
			b.look_at(aimcast.get_collision_point(), Vector3.ZERO)
			b.shoot = true
			#add bullet to scene
			#its something lke add_child(b)
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

	# Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	#move_and_slide()
