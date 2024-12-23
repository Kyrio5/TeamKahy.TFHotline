extends State

func default_lifecycle():
	if(Input.is_action_just_released("Mouse_Cancel")):
		return "seated"
	if(Input.is_action_just_released("Mouse_Confirm")):
		if(GlobalSignalPipe.current_interaction != null):
			return GlobalSignalPipe.current_interaction.interact(self)
	return "continue"
	
func on_exit():
	animator.play_backwards(animation)

func on_enter():
	GlobalSignalPipe.change_context("Bookshelf")
