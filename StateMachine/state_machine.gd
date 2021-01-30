extends Node

signal state_changed(current_state)

export(String) var start_state_name
var current_state = null
var current_state_name = null
var states_map = {}

func initialize():
	for child in get_children():
		child.connect("transition", self, "change_state")
	current_state_name = start_state_name
	current_state = states_map[start_state_name]
	current_state.enter({})

func _physics_process(delta):
	current_state.update(delta)

func change_state(state_name, data):
	var previous_state_name = current_state_name
	current_state.exit()
	current_state = states_map[state_name]
	current_state_name = state_name
	current_state.enter(data)
	emit_signal("state_changed", previous_state_name, state_name)
