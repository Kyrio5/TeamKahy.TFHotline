extends StateMachine


func _ready() -> void:
	super._ready()
	GlobalSignalPipe.CamState = self
