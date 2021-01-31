extends Node

var decay = 60
var max_force = 500
const ScoreLabel = preload("res://Entities/ScoreLabel/ScoreLabel.tscn")

func handle_forces():
	var force = owner.get_applied_force()
	var x = sign(force.x) * clamp(abs(force.x) - decay, 0, max_force)
	var y = clamp(force.y + decay, -max_force, 0)
	owner.set_applied_force(Vector2(x, y))
	if owner.linear_velocity.length() > 400:
		owner.mouth.set_animation("surprised")
	elif owner.mouth.get_animation() != "happy" or owner.state_machine.current_state_name == "dry":
		owner.mouth.set_animation("default")

func add_score(score):
	var score_label = ScoreLabel.instance()
	score_label.global_position = owner.global_position
	owner.get_parent().add_child(score_label)
	score_label.set_as_toplevel(true)
	score_label.set_text("+ " + str(score))
