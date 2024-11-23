extends State



func default_lifecycle():
	if(lasted_longer_than(duration)):
		return "seated"
	return "continue"
