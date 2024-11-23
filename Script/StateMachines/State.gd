extends Node
class_name State

@export var state_name : String
@export var animation : StringName
@export var my_machine : StateMachine
var animator : AnimationPlayer
var start_time : float
var duration : float = 0

func on_enter():
	#called when the state is first switched to
	pass
	
func on_exit():
	#called when the state is exited from
	pass
	
func update():
	#Called every frame. Use this to perform state logic
	pass
	
func default_lifecycle() -> String:
	#checked every frame. Use this to determine state transition logic.
	return most_valid_state()
	
func most_valid_state():
	#Use this to determine the next state, if there are multiple inputs that might affect it
	return "default"

func mark_entered():
	#set the time the state became active
	start_time = Time.get_unix_time_from_system()
	pass

func lifetime() -> float:
	#return how long the state has been active
	return Time.get_unix_time_from_system() - start_time

#lifetime checks
func lasted_longer_than(duration):
	return lifetime() > duration
	
func lasted_shorter_than(duration):
	return lifetime() < duration

func lasted_between(time_1, time_2):
	return time_1 < lifetime() < time_2
	
func check_state():
	#function to check the transition of the state. Used if you want to force a state change outside of normal lifecycle
	return default_lifecycle()
