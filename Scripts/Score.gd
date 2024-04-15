extends Label

func _process(delta):

	self.text = "Score: " + str(Global.score)

	self.text = str(Global.score)
