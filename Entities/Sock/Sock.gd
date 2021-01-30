extends RigidBody2D

signal matched

onready var state_machine = $StateMachine
onready var wet_particles = $WetParticles
onready var drying_particles = $DryingParticles
onready var dried_particles = $DriedParticles
onready var love_particles = $LoveParticles
onready var sprite = $Sprite
onready var timer = $Timer
onready var eyes = $Eyes
onready var mouth = $Mouth
onready var common = $Common

func _start_blink_timer():
	timer.wait_time = rand_range(1, 6)
	timer.start()

func _blink():
	eyes.set_visible(false)
	yield(get_tree().create_timer(0.1), "timeout")
	eyes.set_visible(true)
	_start_blink_timer()
	
func _integrate_forces(state):
	state_machine.current_state.integrate_forces(state)

func _ready():
	state_machine.initialize()
	_start_blink_timer()

func dry(force):
	state_machine.current_state.dry(force)

func stop_drying():
	state_machine.current_state.stop_drying()

func _on_Timer_timeout():
	_blink()

func _on_Sock_body_entered(body):
	state_machine.current_state.on_body_entered(body)
