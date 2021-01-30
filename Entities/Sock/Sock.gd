extends RigidBody2D

var decay = 60
var max_force = 300

func _physics_process(delta):
	var force = get_applied_force()
	var x = sign(force.x) * clamp(abs(force.x) - decay, 0, max_force)
	var y = clamp(force.y + decay, -max_force, 0)
	set_applied_force(Vector2(x, y))
