extends Node2D

onready var start_button = $Menu/VBoxContainer2/StartButton

func _ready():
	start_button.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Main/Main.tscn")
