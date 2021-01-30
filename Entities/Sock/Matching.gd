extends "res://Entities/Sock/sock_state.gd"
var tween

func integrate_forces(state):
	owner.rotation = 0
	owner.linear_velocity = Vector2.UP * 100
	
func _on_tween_completed():
	owner.queue_free()

func enter(_data):
	owner.mouth.set_animation("happy")
	owner.love_particles.set_emitting(true)
	owner.set_collision_layer(0)
	owner.set_collision_mask(0)
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(owner, "modulate", 
	  Color(1, 1, 1, 1), Color(1, 1, 1, 0), 3.0, 
	  Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	tween.connect("tween_completed", self, "_on_tween_completed")
