extends State

func default_lifecycle():
		
	if Input. is_action_just_pressed("Mouse_Cancel"):
		if GlobalSignalPipe.held_item is Book:
			return "book"
	if(Input.is_action_just_released("up")):
		return "seated"
	return "continue"

func on_enter():
	GlobalSignalPipe.change_context("Drawers")

func on_exit():
	animator.play_backwards(animation)
