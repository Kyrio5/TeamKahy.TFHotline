extends State

func on_enter():
	GlobalSignalPipe.phone_picked_up.emit()
	
func default_lifecycle():
	if Input.is_action_just_pressed("Mouse_Cancel"):
		GlobalSignalPipe.phone_put_down.emit()
		return "seated"
	return "continue"
