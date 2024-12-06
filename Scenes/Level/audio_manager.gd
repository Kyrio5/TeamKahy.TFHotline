extends Node
class_name AudioManager

@export var phoneAudioPlayer : AudioStreamPlayer3D 
@export var phoneAudio_Ring : AudioStreamWAV
@export var phoneAudio_Pickup : AudioStreamWAV
@export var phoneAudio_SetDown : AudioStreamWAV

func _ready() -> void:
	GlobalSignalPipe.object_picked_up.connect(play_audio_pick_up)
	GlobalSignalPipe.object_put_down.connect(play_audio_put_down)

func play_audio_phone (audio : AudioStreamWAV) -> void:
	phoneAudioPlayer.stop()
	phoneAudioPlayer.stream = audio
	phoneAudioPlayer.play()

func play_audio_pick_up(type : Utility.ObjectType):
	match type:
		Utility.ObjectType.PHONE:
			pass
		Utility.ObjectType.PAPER:
			pass
		Utility.ObjectType.BOOK:
			print("Book Up")
			pass
		Utility.ObjectType.BINDER:
			pass
		_:	#default
			pass
			
func play_audio_put_down(type : Utility.ObjectType):
	match type:
		Utility.ObjectType.PHONE:
			pass
		Utility.ObjectType.PAPER:
			pass
		Utility.ObjectType.BOOK:
			print("Book Down")
			pass
		Utility.ObjectType.BINDER:
			pass
		_:	#default
			pass
