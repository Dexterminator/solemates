extends Node2D

const initial_game_time = 120
var score = 0
var game_time = initial_game_time
var sock_count = 0
onready var shake_camera = $ShakeCamera2D
onready var gui = $CanvasLayer/GUI
onready var screen_size = get_viewport_rect().size
onready var spawn_timer = $SpawnTimer
onready var ticker = $Ticker
const WarpGate = preload("res://Entities/WarpGate/WarpGate.tscn")
const Sock = preload("res://Entities/Sock/Sock.tscn")
const score_file = preload("res://Helpers/ScoreFile.gd")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	gui.set_time(game_time)

func _on_Sock_matched():
	shake_camera.add_trauma(0.4)
	score += 100
	gui.set_score(score)
	sock_count -= 2

func _on_Sock_dried():
	shake_camera.add_trauma(0.3)
	score += 10
	gui.set_score(score)
	
func _game_over():
	yield (get_tree().create_timer(1.5), "timeout")
	score_file.save_high_score(score)
	get_tree().change_scene("res://Scenes/GameOver/GameOver.tscn")

func _on_Ticker_timeout():
	game_time -= 1
	gui.set_time(game_time)
	if game_time == 0:
		gui.set_time("Time's up!")
		ticker.stop()
		_game_over()

func _on_SpawnTimer_timeout():
	var x = rand_range(50, screen_size.x - 50)
	var warp_gate = WarpGate.instance()
	add_child(warp_gate)
	warp_gate.global_position.x = x
	warp_gate.global_position.y = 100
	yield (get_tree().create_timer(1), "timeout")
	var sock = Sock.instance()
	add_child(sock)
	sock.global_position = warp_gate.sock_spawn.global_position
	sock.connect("matched", self, "_on_Sock_matched")
	sock.connect("dried", self, "_on_Sock_dried")
	var wait_time = min(sock_count * 0.5 + 1, 6)
	spawn_timer.set_wait_time(wait_time)
	sock_count += 1
