extends Sprite

var tween
onready var sock_spawn = $SockSpawn

func _process(delta):
	rotation += 20 * delta

func _on_tween_completed():
	queue_free()

func _ready():
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "modulate", 
	  Color(1, 1, 1, 1), Color(1, 1, 1, 0), 3.0, 
	  Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	tween.connect("tween_completed", self, "_on_tween_completed")
