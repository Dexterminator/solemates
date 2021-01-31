extends Node2D

onready var start_button = $Menu/VBoxContainer2/StartButton
onready var button_sfx = $ButtonSound

func _ready():
	start_button.grab_focus()

func _on_StartButton_pressed():
	button_sfx.play()
	start_button.set_disabled(true)

func _on_ButtonSound_finished():
	get_tree().change_scene("res://Scenes/Main/Main.tscn")
