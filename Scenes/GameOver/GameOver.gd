extends Node2D

var progress_possible = false
onready var score_label = $MarginContainer/VBoxContainer/HBoxContainer2/ScoreLabel
onready var pun_label = $MarginContainer/VBoxContainer/HBoxContainer3/PunLabel
const score_file = preload("res://Helpers/ScoreFile.gd")
var puns = [
	"Get rich or die drying.",
	"Do you ever feel like you might have Sockholm syndrome?",
	"I'll be doing this until the day I dry.",
	"That was fan-tastic!",
	"Does making laundry puns mean you've reached sock bottom?",
	"I scored zero points and became the laughing sock of the whole town.",
	"Wow, those socks are in lint condition.",
	"If you don't think this funny you need a dryer sense of humor.",
	"You are a sock star!"
]

func random_choice(arr):
	return arr[randi() % arr.size()]

func _ready():
	var latest_score = score_file.get_scores()["latest_score"]
	score_label.set_text(str(latest_score))
	pun_label.set_text(random_choice(puns))

func _process(delta):
	if progress_possible and (Input.is_action_just_pressed("fan") or Input.is_action_just_pressed("ui_accept")):
		get_tree().change_scene("res://Scenes/MainMenu/MainMenu.tscn")

func _on_Timer_timeout():
	progress_possible = true
