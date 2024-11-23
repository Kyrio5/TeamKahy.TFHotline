extends Node


@export var UI_node : Control
@export var HeldItem : Node3D

var context : String :
	set(value):
		context = value
		UI_node.context_label.text = context


func mouse_over_context(area : Area3D):
	if area is Interaction:
		context = area.context
		

func mouse_off_context(area : Area3D):
	context = ""
