extends State

func default_lifecycle():
	if(Input.is_action_just_released("Mouse_Cancel")):
		return "seated"
	return "continue"

func on_enter():
	GlobalSignalPipe.change_context("Drawers")

func on_exit():
	animator.play_backwards(animation)
