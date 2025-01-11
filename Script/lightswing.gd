extends SpotLight3D

var selfOriginalPos : Vector3

func _ready() -> void:
	selfOriginalPos = self.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	SineWaveSwing(self, selfOriginalPos)


func SineWaveSwing(objToSwing : Node, objToSwingOriginalPos : Vector3):
	var posVector = Vector3(sin(0.001 * Time.get_ticks_msec()) * 0.25, 0, 0)
	objToSwing.position = objToSwingOriginalPos + Vector3(posVector.x, posVector.y, posVector.z)
