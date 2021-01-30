extends MarginContainer

onready var score_label = $HBoxContainer/VBoxContainer/HBoxContainer/Score
onready var time_label = $HBoxContainer/VBoxContainer/HBoxContainer2/Time

func set_score(new_score):
	score_label.set_text(str(new_score))

func set_time(new_time):
	time_label.set_text(str(new_time))
