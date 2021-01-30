extends "res://Entities/Sock/sock_state.gd"

func enter(_data):
	owner.sprite.modulate = Color(1, 1, 1)
	owner.wet_particles.set_emitting(false)
	owner.drying_particles.set_emitting(false)

func update(_delta):
	owner.common.handle_forces()

func dry(force):
	owner.add_force(Vector2.ZERO, force)
