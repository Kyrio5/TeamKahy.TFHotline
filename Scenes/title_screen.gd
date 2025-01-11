extends Control
class_name TitleScreen

@export var titleSoundPlayer : AudioStreamPlayer
@export var titleMusicPlayer : AudioStreamPlayer
@export var hoverSFX : AudioStreamWAV
@export var selectSFX : AudioStreamWAV
@export var bgMusic : AudioStreamWAV

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	pass


func _on_enter_game_button_pressed() -> void:
	titleMusicPlayer.stop()
	GlobalSignalPipe.GameState.switch_state("main")


# ---Used for all buttons on the title screen---

# Hover SFX
func _on_game_button_mouse_entered() -> void:
	titleSoundPlayer.stop()
	titleSoundPlayer.stream = hoverSFX
	titleSoundPlayer.pitch_scale = rng.randf_range(0.98, 1.02)
	titleSoundPlayer.play()

# Click SFX
func _on_game_button_mouse_clicked() -> void:
	titleSoundPlayer.stop()
	titleSoundPlayer.stream = selectSFX
	titleSoundPlayer.pitch_scale = rng.randf_range(0.98, 1.02)
	titleSoundPlayer.play()
