extends Node2D

var tween
onready var sock_spawn = $SockSpawn
onready var sprite = $Sprite

func _process(delta):
	sprite.rotation += 20 * delta

func _on_tween_completed(_tween):
	queue_free()

func _ready():
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(sprite, "modulate",
	  Color(1, 1, 1, 1), Color(1, 1, 1, 0), 4.0,
	  Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	tween.connect("tween_completed", self, "_on_tween_completed")
