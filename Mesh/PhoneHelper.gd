extends Node3D
@onready var phone_anim: AnimationPlayer = $PhoneAnim
@onready var blinkin: AnimationPlayer = $MeshInstance3D/Blinkin
func _ready() -> void:
	GlobalSignalPipe.phone_picked_up.connect(pick_up_phone)
	GlobalSignalPipe.phone_put_down.connect(hang_up_phone)
	GlobalSignalPipe.phone_ring_start.connect(ring)
	GlobalSignalPipe.phone_ring_stop.connect(stopring)
	
func pick_up_phone():
	phone_anim.play("Phone/PickUpPhone")

func hang_up_phone():
	phone_anim.play_backwards("Phone/PickUpPhone")
	
func ring():
	blinkin.play("Blink")

func stopring():
	blinkin.play("Off")
