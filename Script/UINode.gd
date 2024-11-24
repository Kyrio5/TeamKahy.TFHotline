extends Control
class_name UINode
@export var title_overlay : TitleScreen
@export var context_label : Label

func _ready() -> void:
	GlobalSignalPipe.UI_node = self
	GlobalSignalPipe.context = ""
