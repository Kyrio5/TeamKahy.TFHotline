extends Node
class_name AudioManager

@export var phoneAudioPlayer : AudioStreamPlayer3D 
@export var phoneAudio_Ring : AudioStreamWAV
@export var phoneAudio_Pickup : AudioStreamWAV
@export var phoneAudio_SetDown : AudioStreamWAV

func play_audio_phone (audio : AudioStreamWAV) -> void:
	phoneAudioPlayer.stop()
	phoneAudioPlayer.stream = audio
	phoneAudioPlayer.play()
