extends State

var closed = false

func _ready() -> void:
	GlobalSignalPipe.close_book.connect(close)

func close():
	closed = true

func default_lifecycle():
	if(lasted_longer_than(duration)):
		GlobalSignalPipe.UI_node.book_contents.show()
	if closed:
		return machine.previous_state_name
	return "continue"
	
func on_exit():
	GlobalSignalPipe.UI_node.book_contents.hide()
	animator.play_backwards(animation)
	closed = false

func on_enter():
	GlobalSignalPipe.open_book.emit()
