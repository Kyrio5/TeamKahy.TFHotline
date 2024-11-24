extends Control
class_name TitleScreen

func _on_enter_game_button_pressed() -> void:
	GlobalSignalPipe.GameState.switch_state("main")
