extends State
@export var title_screen:TitleScreen

func on_enter():
	title_screen.show()
	pass

func default_lifecycle():
	return "continue"

func on_exit():
	GlobalSignalPipe.CamState.switch_state("intro")
	title_screen.hide()
	pass
