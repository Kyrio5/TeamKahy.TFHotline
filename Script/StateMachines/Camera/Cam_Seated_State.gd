extends State
@export_range(0.1, 3.0, 0.1, "or_greater") var camera_sens: float = 1

var mouse_captured: bool = false
var look_dir: Vector2 # Input direction for look/aim

@onready var camera: Camera3D
func default_lifecycle():
	if Input.is_action_just_released("Mouse_Confirm"):
		if GlobalSignalPipe.current_interaction != null:
			return GlobalSignalPipe.current_interaction.interact(body)
	return "continue"

func on_enter() -> void:
	GlobalSignalPipe.change_context("Seated")
	camera = my_machine.body

func _input(event: InputEvent) -> void:
	pass

func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true

func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false

func _rotate_camera(sens_mod: float = 1.0) -> void:
	camera.rotation.y -= look_dir.x * camera_sens * sens_mod
	camera.rotation.x = clamp(camera.rotation.x - look_dir.y * camera_sens * sens_mod, -1.5, 1.5)
