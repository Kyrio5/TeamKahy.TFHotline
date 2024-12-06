extends Node

signal current_item_changed
signal object_picked_up(type)
signal object_put_down(type)
signal phone_picked_up
signal phone_put_down
signal phone_ring_start
signal phone_ring_stop
signal state_start(state_name)

@export var UI_node : UINode
@export var GameState : StateMachine
@export var CamState : StateMachine
var current_interaction : Interaction
var current_item : String :
	set(value):
		if(current_item != value):
			current_item = value
			emit_signal("current_item_changed")
		else:
			current_item = value


var held_item : Holdable
var carry_slot: ItemSlot

@export var interactionZones : Array[Node]

var context : String :
	set(value):
		context = value
		UI_node.context_label.text = context

func change_context(new_context : String):
	for x : Node3D in interactionZones:
		x.hide()
		if x.name == new_context:
			x.show()

func mouse_over_context(area : Area3D):
	if area is Interaction:
		current_interaction = area
		context = area.get_context()
		
func mouse_off_context(area : Area3D):
	current_interaction = null
	context = ""
