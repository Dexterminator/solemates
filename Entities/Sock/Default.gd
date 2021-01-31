extends "res://Entities/Sock/sock_state.gd"

const initial_wet_hp = 150.0
var wet_hp = initial_wet_hp

func _get_blue():
	var hp_ratio = wet_hp / initial_wet_hp
	return 0.3 + 0.5 - hp_ratio * 0.3

func enter(_data):
	owner.sprite.modulate = Color(_get_blue(), 1, 1)
	
func exit():
	owner.drying_sfx.stop()

func update(_delta):
	owner.common.handle_forces()

func dry(force):
	var hp_ratio = wet_hp / initial_wet_hp
	owner.drying_sfx.set_pitch_scale(1 + 0.5 * (1- hp_ratio))
	if not owner.drying_sfx.is_playing():
		owner.drying_sfx.play()
	owner.add_force(Vector2.ZERO, force)
	owner.mouth.set_animation("happy")
	owner.wet_particles.set_emitting(false)
	owner.drying_particles.set_emitting(true)
	wet_hp -= 1
	owner.sprite.modulate = Color(_get_blue(),  1 ,1)
	if wet_hp <= 0:
		emit_signal("transition", "dry", null)

func stop_drying():
	owner.drying_sfx.stop()
	owner.mouth.set_animation("default")
	owner.wet_particles.set_emitting(true)
	owner.drying_particles.set_emitting(false)
