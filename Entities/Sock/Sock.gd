extends RigidBody2D

var decay = 60
var max_force = 300
onready var wet_particles = $WetParticles
onready var drying_particles = $DryingParticles
onready var timer = $Timer
onready var eyes = $Eyes

func _start_blink_timer():
	timer.wait_time = rand_range(1, 6)
	timer.start()

func _blink():
	eyes.set_visible(false)
	yield(get_tree().create_timer(0.1), "timeout")
	eyes.set_visible(true)
	_start_blink_timer()

func _ready():
	_start_blink_timer()

func _physics_process(delta):
	var force = get_applied_force()
	var x = sign(force.x) * clamp(abs(force.x) - decay, 0, max_force)
	var y = clamp(force.y + decay, -max_force, 0)
	set_applied_force(Vector2(x, y))

func dry():
	wet_particles.set_emitting(false)
	drying_particles.set_emitting(true)

func stop_drying():
	wet_particles.set_emitting(true)
	drying_particles.set_emitting(false)


func _on_Timer_timeout():
	_blink()
