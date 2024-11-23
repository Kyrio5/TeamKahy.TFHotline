extends Area3D
class_name Interaction

@export var context : String

func _ready() -> void:
	mouse_entered.connect(_on_area_3d_mouse_entered)
	mouse_exited.connect(_on_area_3d_mouse_exited)

func _on_area_3d_mouse_entered() -> void:
	GlobalSignalPipe.mouse_over_context(self)
	pass # Replace with function body.


func _on_area_3d_mouse_exited() -> void:
	GlobalSignalPipe.mouse_off_context(self)
	pass # Replace with function body.
