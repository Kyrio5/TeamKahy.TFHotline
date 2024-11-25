extends Node
class_name AudioManager

@export var phoneAudioPlayer : AudioStreamPlayer3D 
@export var phoneAudio_Ring : AudioStreamWAV
@export var phoneAudio_Pickup : AudioStreamWAV
@export var phoneAudio_SetDown : AudioStreamWAV

func _play_Audio_Phone (audio : AudioStreamWAV) -> void:
	phoneAudioPlayer.stop()
	phoneAudioPlayer.stream = audio
	phoneAudioPlayer.play()
