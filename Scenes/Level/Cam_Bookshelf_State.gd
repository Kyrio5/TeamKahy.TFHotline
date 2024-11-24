extends State

func default_lifecycle():
	if(Input.is_action_just_released("Mouse_Cancel")):
		return "seated"
	if(Input.is_action_just_released("Mouse_Confirm")):
		return GlobalSignalPipe.current_interaction.interact(self)
	return "continue"
	
func on_exit():
	animator.play_backwards(animation)
