extends KinematicBody2D

onready var state_machine = $StateMachine
onready var fan = $Fan
onready var fan_hitbox = $Fan/Area2D
onready var fan_paricles = $Fan/Particles2D
onready var eyes = $Fan/Eyes
onready var mouth = $Fan/Mouth
onready var sfx = $FanSound

func _ready():
	state_machine.initialize()
	var stream = sfx.stream
	stream.loop_mode = AudioStreamSample.LOOP_PING_PONG
	stream.loop_begin = 0
	stream.loop_end = stream.get_length() * stream.mix_rate

func _physics_process(delta):
	state_machine.current_state.update(delta)

func _on_Area2D_body_exited(body):
	if body.is_in_group("socks"):
		body.stop_drying()
