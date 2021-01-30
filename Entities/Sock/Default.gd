extends "res://Entities/Sock/sock_state.gd"

const initial_wet_hp = 100.0
var wet_hp = initial_wet_hp

func _get_alpha():
	var hp_ratio = wet_hp / initial_wet_hp
	return 0.3 + 0.5 - hp_ratio * 0.3

func enter(_data):
	owner.sprite.modulate = Color(_get_alpha(), 1, 1)

func update(_delta):
	owner.common.handle_forces()

func dry(force):
	owner.add_force(Vector2.ZERO, force)
	owner.mouth.set_animation("happy")
	owner.wet_particles.set_emitting(false)
	owner.drying_particles.set_emitting(true)
	wet_hp -= 1
	owner.sprite.modulate = Color(_get_alpha(),  1 ,1)
	if wet_hp <= 0:
		emit_signal("transition", "dry", null)

func stop_drying():
	owner.mouth.set_animation("default")
	owner.wet_particles.set_emitting(true)
	owner.drying_particles.set_emitting(false)
