extends "res://StateMachine/state.gd"

var wet_hp = 100

func enter(_data):
	owner.sprite.modulate = Color(0.6, 1, 1)

func update(_delta):
	owner.common.handle_forces()

func dry():
	owner.mouth.set_animation("happy")
	owner.wet_particles.set_emitting(false)
	owner.drying_particles.set_emitting(true)
	wet_hp -= 1
	print(wet_hp)
	if wet_hp <= 0:
		emit_signal("transition", "dry", null)

func stop_drying():
	owner.mouth.set_animation("default")
	owner.wet_particles.set_emitting(true)
	owner.drying_particles.set_emitting(false)
