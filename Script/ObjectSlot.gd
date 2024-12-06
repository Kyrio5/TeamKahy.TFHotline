extends Interaction
class_name ItemSlot

var held_item : Holdable = null
@export var player_slot : bool = false
@export var slot_position : Node3D
@export var indicator: MeshInstance3D

func _ready() -> void:
	if player_slot:
		GlobalSignalPipe.carry_slot = self
	if slot_position.get_child_count() != 0:
		if slot_position.get_child(0) is Holdable:
			held_item = slot_position.get_child(0)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
func get_context():
	if held_item == null:
		if GlobalSignalPipe.held_item == null:
			return ""
		return context
	return held_item.context

func interact(body):
	if GlobalSignalPipe.held_item == null:
		if held_item != null:
			GlobalSignalPipe.held_item = held_item
			held_item.picked_up(held_item.object_type)
			held_item.reparent(GlobalSignalPipe.carry_slot.slot_position)
			held_item = null
			
	else:
		if held_item == null:
			GlobalSignalPipe.held_item.reparent(slot_position)
			held_item = GlobalSignalPipe.held_item
			held_item.put_down(held_item.object_type)
			GlobalSignalPipe.held_item= null
	return "continue"

func _on_mouse_entered() -> void:
	GlobalSignalPipe.mouse_over_context(self)
	if(indicator != null):
		indicator.show()
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	GlobalSignalPipe.mouse_off_context(self)
	if(indicator != null):
		indicator.hide()
	pass # Replace with function body.
