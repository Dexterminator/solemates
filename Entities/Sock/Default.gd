extends "res://StateMachine/state.gd"

var decay = 60
var max_force = 300

func update(_delta):
	var force = owner.get_applied_force()
	var x = sign(force.x) * clamp(abs(force.x) - decay, 0, max_force)
	var y = clamp(force.y + decay, -max_force, 0)
	owner.set_applied_force(Vector2(x, y))
	if owner.linear_velocity.length() > 500:
		owner.mouth.set_animation("surprised")
	else:
		owner.mouth.set_animation("default")
