extends Node3D

@export var items : Dictionary
var new_object: String:
	set(value):
		new_object = value
		anim.play("SwapItem")
@onready var anim: AnimationPlayer = $"../../ItemSwapAnimator"

func _ready() -> void:
	GlobalSignalPipe.current_item_changed.connect(picked_up_item)
	for x in get_children():
		items[x.name] = x

func picked_up_item():
	new_object = GlobalSignalPipe.current_item

func swap_objects():
	for x in items:
		items[x].hide()
	if(new_object != ""):
		if(items.has(new_object)):
			items[new_object].show()
			new_object = ""
