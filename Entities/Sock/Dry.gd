extends "res://Entities/Sock/sock_state.gd"

func enter(_data):
	owner.dried_sfx.play()
	owner.sprite.modulate = Color(1, 1, 1)
	owner.wet_particles.set_emitting(false)
	owner.drying_particles.set_emitting(false)
	owner.dried_particles.set_emitting(true)
	owner.emit_signal("dried")
	owner.common.add_score(10)

func update(_delta):
	owner.common.handle_forces()

func dry(force):
	owner.add_force(Vector2.ZERO, force)

func on_body_entered(body):
	if body.is_in_group("socks") and body.state_machine.current_state_name == "dry":
		owner.common.add_score(100)
		owner.emit_signal("matched")
		emit_signal("transition", "matching", null)
		body.state_machine.current_state.emit_signal("transition", "matching", null)
