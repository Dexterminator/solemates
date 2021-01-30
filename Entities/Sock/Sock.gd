extends RigidBody2D

onready var state_machine = $StateMachine
onready var wet_particles = $WetParticles
onready var drying_particles = $DryingParticles
onready var timer = $Timer
onready var eyes = $Eyes
onready var mouth = $Mouth

func _start_blink_timer():
	timer.wait_time = rand_range(1, 6)
	timer.start()

func _blink():
	eyes.set_visible(false)
	yield(get_tree().create_timer(0.1), "timeout")
	eyes.set_visible(true)
	_start_blink_timer()

func _ready():
	state_machine.initialize()
	_start_blink_timer()

func dry():
	mouth.set_animation("happy")
	wet_particles.set_emitting(false)
	drying_particles.set_emitting(true)

func stop_drying():
	mouth.set_animation("default")
	wet_particles.set_emitting(true)
	drying_particles.set_emitting(false)

func _on_Timer_timeout():
	_blink()
