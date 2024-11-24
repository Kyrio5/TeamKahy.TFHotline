extends Node

@export var UI_node : Control
@export var GameState : StateMachine
@export var CamState : StateMachine

var current_interaction : Interaction

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
		context = area.context
		

func mouse_off_context(area : Area3D):
	current_interaction = null
	context = ""
