extends Label

func _process(delta):
	self.text = "Arrows: " + str(Global.arrowCount)
