extends Node2D

class_name ScoreFile

const file_path = "user://score.save"

static func get_scores():
	var score_file = File.new()
	if not score_file.file_exists(file_path):
		return

	score_file.open("user://score.save", File.READ)
	return parse_json(score_file.get_as_text())

static func save_high_score(new_score):
	var high_score = 0
	var score_file = File.new()
	score_file.open(file_path, File.WRITE)
	
	score_file.store_string(to_json({
		"latest_score": new_score,
		"high_score": new_score
		}))
	score_file.close()
