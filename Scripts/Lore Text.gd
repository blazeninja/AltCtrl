extends Label

var example_text = "You are an archer in training.\nShoot the targets to gain points.\nGather enough points to move on\nto your next trial.\nSucceed in all trials to become\na fully fledged archer!"

func _ready():
	scroll_text(example_text)
	
func scroll_text(input_text:String):
	visible_characters = 0
	text = input_text
	
	for i in text.length():
		visible_characters += 1
		await get_tree().create_timer(0.05).timeout
