extends State
@export_range(0.1, 3.0, 0.1, "or_greater") var camera_sens: float = 1

var mouse_captured: bool = false
var look_dir: Vector2 # Input direction for look/aim


func default_lifecycle():
	if Input.is_action_just_pressed("Mouse_Confirm"):
		if GlobalSignalPipe.current_interaction != null:
			var interaction = GlobalSignalPipe.current_interaction
			GlobalSignalPipe.current_interaction = null
			return interaction.interact(machine.body)
	
	if Input. is_action_just_pressed("Mouse_Cancel"):
		if GlobalSignalPipe.held_item is Book:
			return "book"
	
	if Input.is_action_just_pressed("left"):
		return "noodle"
	if Input.is_action_just_pressed("right"):
		return "bookshelf"
	if Input.is_action_just_pressed("down"):
		return "drawers"
	
	# Currently for draggables only. If you want to use this for more general
	# interactions, look into why GlobalSignalPipe.current_interaction returns
	# null here. - Kai
	if Input.is_action_just_released("Mouse_Confirm"):
		if GlobalSignalPipe.current_draggable != null:
			print(GlobalSignalPipe.current_draggable.get_context())
			var interaction = GlobalSignalPipe.current_draggable
			interaction._on_area_3d_mouse_exited()
			return interaction.forceStopInteract(machine.body)
	
	return "continue"

func on_enter() -> void:
	GlobalSignalPipe.change_context("Seated")


func _input(event: InputEvent) -> void:
	pass

func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true

func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false

func _rotate_camera(sens_mod: float = 1.0) -> void:
	var camera = machine.body
	camera.rotation.y -= look_dir.x * camera_sens * sens_mod
	camera.rotation.x = clamp(camera.rotation.x - look_dir.y * camera_sens * sens_mod, -1.5, 1.5)
