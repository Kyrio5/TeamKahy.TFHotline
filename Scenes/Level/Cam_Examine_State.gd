extends State

@onready var object_animator: AnimationPlayer = $"../../ObjectAnimator"
var abort = false

func on_enter():
	animation = StringName("ObjectAnim/PickUp"+GlobalSignalPipe.context)
	if object_animator.has_animation(animation):
		object_animator.play(animation)
	else:
		abort = true
		

func default_lifecycle():
	if(abort or Input.is_action_just_released("Mouse_Cancel")):
		return "seated"
	return "continue"
	
	
func on_exit():
	abort = false
	if object_animator.has_animation(animation):
		object_animator.play_backwards(animation)
