extends Label

var example_text = "You have completed your archery training.\nUpon seeing your progress, the king has\nappointed you to be his royal archer.\nIt's hard work, but it's worth the effort.\nYou feel accomplished in your training!\nCongratulations."

func _ready():
	scroll_text(example_text)
	
func scroll_text(input_text:String):
	visible_characters = 0
	text = input_text
	
	for i in text.length():
		visible_characters += 1
		await get_tree().create_timer(0.05).timeout
