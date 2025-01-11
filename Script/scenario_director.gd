extends Node

# Local class setup
enum ScenarioState {
	Default, # Before the phone rings
	PhoneRinging, # Whilst the phone is ringing, things may happen
	OnPhone_Intro, # For when the patient is explaining their initial problems
	OnPhone_Question, # For when you pick up the phone to ask the patient another question
	ActivePatient, # For whilst you have a patient but you're not on the phone
	PatientCompleteFeedback # For after you've finished with a patient, but before the next patient, whilst you're getting feedback
}

# public variables
@export var audioManager : AudioManager
@export var phoneInteraction : Interaction

# private variables
var rng = RandomNumberGenerator.new()
var mainState : ScenarioState
var waitTimer : float # How long to wait before giving the player something to do

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	waitTimer = 10 # Always start at one minute to get the player acquainted


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (GlobalSignalPipe.GameState.current_state.state_name == "main"):
		match mainState:
			ScenarioState.Default:
				if (waitTimer > 0):
					waitTimer -= delta
				else:
					mainState = ScenarioState.PhoneRinging
					GlobalSignalPipe.phone_ring_start.emit()
					audioManager.play_audio_phone(audioManager.phoneAudio_Ring)
			ScenarioState.PhoneRinging:
				if (waitTimer > 0):
					waitTimer -= delta
				else:
					waitTimer = 2.5
					audioManager.play_audio_phone(audioManager.phoneAudio_Ring)
				
				if (GlobalSignalPipe.current_interaction == phoneInteraction):
					pass
					#print("phone interacting")
			ScenarioState.OnPhone_Intro:
				pass
			ScenarioState.OnPhone_Question:
				pass
			ScenarioState.ActivePatient:
				pass
			ScenarioState.PatientCompleteFeedback:
				pass
