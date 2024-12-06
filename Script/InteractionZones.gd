extends Node3D

func _ready() -> void:
	GlobalSignalPipe.interactionZones = get_children()
