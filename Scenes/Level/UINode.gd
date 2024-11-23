extends Control

@export var context_label : Label

func _ready() -> void:
	GlobalSignalPipe.UI_node = self
	GlobalSignalPipe.context = ""
