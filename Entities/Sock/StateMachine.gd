extends "res://StateMachine/state_machine.gd"

func _ready():
	states_map = {
		"default": $Default,
		"dry": $Dry,
		"matching": $Matching
	}
