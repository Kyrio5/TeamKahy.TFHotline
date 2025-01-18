extends Control


func close_book():
	GlobalSignalPipe.close_book.emit()
