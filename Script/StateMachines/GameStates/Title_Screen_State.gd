extends State

func on_enter():
	GlobalSignalPipe.UI_node.title_overlay.show()
	pass

func default_lifecycle():
	return "continue"

func on_exit():
	GlobalSignalPipe.CamState.switch_state("intro")
	GlobalSignalPipe.UI_node.title_overlay.hide()
	pass
