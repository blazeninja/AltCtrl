extends Label

func _process(_delta):
	self.text = "Score: " + str(Global.score)
