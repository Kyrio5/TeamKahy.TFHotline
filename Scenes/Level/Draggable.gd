extends Interaction
class_name Draggable

@export var camera : Camera3D

var mousePos : Vector3
var lerpStartPos : Vector3
var tempPosDeleteLater : Vector3

var pinned : bool
var lerpValue : float

var raycastHit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	lerpStartPos = self.global_position
	tempPosDeleteLater = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# If the object is currently draggable
	if GlobalSignalPipe.current_draggable == self:
		# Set the mouse position to the current mouse position
		var mousePos = camera.project_position(get_viewport().get_mouse_position(), camera.global_transform.origin.z * 2)
		var mousePos2D = get_viewport().get_mouse_position()

		
		# Create a raycast from the mouse position outwards (why is this so cumbersome)
		var space = get_world_3d().direct_space_state
		var rayStart = camera.project_ray_origin(mousePos2D)
		var rayEnd = rayStart + camera.project_ray_normal(mousePos2D) * 100 # cast for 100m
		var rayQuery = PhysicsRayQueryParameters3D.create(rayStart, rayEnd, 4294967295 - 3, [self])
		rayQuery.collide_with_areas = true
		#rayQuery.exclude = [self, $CSGBox3D, $CollisionShape3D]
		raycastHit = space.intersect_ray(rayQuery)
		
		print(raycastHit)
		
		var dragPos : Vector3
		
		if not raycastHit.is_empty():
			#var directionToHit = raycastHit.position - camera.position
			#dragPos = raycastHit.position - directionToHit * 0
			dragPos = Vector3(mousePos.x, mousePos.y, mousePos.z)
		else:
			dragPos = Vector3(mousePos.x, mousePos.y, mousePos.z)
		
		# Lerp the paper towards the mouse until it reaches it, then lock it to the mouse position relative to the camera
		self.global_position = lerpStartPos.lerp(dragPos, lerpValue)
		lerpValue = clamp(lerpValue + delta * 8, 0, 1)
	else:
		self.global_position = lerpStartPos.lerp(tempPosDeleteLater, lerpValue)
		lerpValue = clamp(lerpValue + delta * 10, 0, 1)


func _on_mouse_entered() -> void:
	GlobalSignalPipe.mouse_over_context(self)


func _on_mouse_exited() -> void:
	GlobalSignalPipe.mouse_off_context(self)


func interact(body):
	# If there is no current draggable
	if GlobalSignalPipe.current_draggable == null:
		# Set draggable to self
		GlobalSignalPipe.current_draggable = self
		# If the draggable is pinned
		if (pinned):
			# unpin it
			pinned = false
			GlobalSignalPipe.object_drag_unpin.emit
		# Start drag lerp
		lerpValue = 0
		lerpStartPos = self.global_position
		tempPosDeleteLater = self.global_position
	return "continue"

func forceStopInteract(body):
	print("drag end")
	# If this is the draggable being held by the global signal pipe
	if GlobalSignalPipe.current_draggable == self:
		# Let go of it
		GlobalSignalPipe.current_draggable = null
		# If the draggable is hovering over the corkboard
			# Pin it
		# Set its position to where the mouse is hovering
		lerpValue = 0
		lerpStartPos = self.global_position
	return "continue"
