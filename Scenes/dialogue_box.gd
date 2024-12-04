extends Control

@export var dialogueText : RichTextLabel

var currentSpeechText : String
var currentSpeechIndex : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(5).timeout
	_say_dialogue("I am saying dialogue")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	


func _say_dialogue(speech: String) -> void:
	currentSpeechText = ""
	currentSpeechIndex = 1
	_await_print_dialogue_char(speech)
	

func _await_print_dialogue_char(speech: String):
	await get_tree().create_timer(0.05).timeout
	currentSpeechText = speech.left(currentSpeechIndex)
	dialogueText.text = currentSpeechText
	currentSpeechIndex += 1
	if (currentSpeechText.length() < speech.length()):
		_await_print_dialogue_char(speech)
	else:
		pass
