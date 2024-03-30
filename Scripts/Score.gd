extends Label


# Called when the node enters the scene tree for the first time.
var score = 0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(score)
	pass
