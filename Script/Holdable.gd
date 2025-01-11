extends Node3D
class_name Holdable

@export var context : String
@export var object_type : Utility.ObjectType

func _process(delta: float) -> void:
	position = position.slerp(Vector3.ZERO, 5 * delta)
	rotation = rotation.slerp(Vector3.ZERO, 5 * delta)
	if position.distance_to(Vector3.ZERO) < .01: position = Vector3.ZERO
	if rotation.distance_to(Vector3.ZERO) < .01: rotation = Vector3.ZERO
	pass

func picked_up(type):
	GlobalSignalPipe.object_picked_up.emit(type)
	
func put_down(type):
	GlobalSignalPipe.object_put_down.emit(type)
	
