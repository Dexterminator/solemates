extends MarginContainer

onready var score_label = $HBoxContainer/VBoxContainer/HBoxContainer/Score

func set_score(new_score):
	score_label.set_text(str(new_score))
