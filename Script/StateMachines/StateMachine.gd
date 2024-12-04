extends Node
class_name StateMachine

@export var body : Node3D
@export var current_state : State
@export var animator : AnimationPlayer
var states_list : Dictionary
###
#State Machine Function:
# Read states from children, save into a list
# Set current state to default
# run the update function on the current state every frame
# when the state's lifecycle ends, switch states. Switching does the following:
# - perform the exit function of the current state
# - set the current state to the new state
# - perform the entrance function of the current state
# - if an animation comes with the state, play it

func _ready() -> void:
	#We want to populate the list of states
	load_states()
	#Switch to the default state
	switch_state("default")

func load_states():
	#Read the childern, and gather all nodes that are states
	for x in get_children():
		if x is State:
			#set the state to their state_name in the dictionary
			states_list[x.state_name] = x
			x.animator = animator
		
			x.machine = self

func switch_state(new_state : String):
	if(current_state != null):
		#if there's a state currently active, then do its exit function
		current_state.on_exit()
	#Set the new state from the given string
	current_state = states_list[new_state]
	#Set the time the state was entered
	current_state.mark_entered()
	#Run the entrance function
	current_state.on_enter()
	#Play the transition animation if applicable
	if(animator != null):
		if(animator.has_animation(current_state.animation)):
			current_state.duration = animator.get_animation(current_state.animation).length
			animator.play(current_state.animation)

func _process(delta: float) -> void:
	if(current_state != null):
		#every frame, be sure to update the state
		current_state.update()
		#get the status of the state, and check if we need to change it
		var status = current_state.check_state()
		#if we're not told to continue, we swap to the new state
		if(status != "continue"):
			if(states_list.has(status)):
				switch_state(status)
			else: #if the status isn't one of the our states, it should tell us what to do
				if(GlobalSignalPipe.current_interaction != null):
					status = GlobalSignalPipe.current_interaction.interact(self)
					if(states_list.has(status)):
						switch_state(status)	
					else:
						#if it's still not there, ignore it :V
						print("ERR: State not found")
				else:
					print("ERR: State not found")
	else:
		switch_state("default")
