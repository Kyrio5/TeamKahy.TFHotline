extends State

func default_lifecycle():
		
	if Input. is_action_just_pressed("Mouse_Cancel"):
		if GlobalSignalPipe.held_item is Book:
			return "book"
	if(Input.is_action_just_pressed("ui_right")):
		return "seated"
	return "continue"

func on_exit():
	animator.play_backwards(animation)
