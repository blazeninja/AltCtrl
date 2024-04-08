extends Label


# Called when the node enters the scene tree for the first time.
#@onready var score = $"/root/Score"
var score = 0
func _ready():
	#goto autoloasd
	#get score
	#add score to text
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(score)
	pass
