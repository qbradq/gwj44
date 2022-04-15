extends Label


export var score_index:int = 1


func _ready():
	refresh()


func refresh():
	var score = HighScores.scores[score_index-1]
	var ltime = score[1]
	var minutes = ltime / 60
	var seconds = ltime % 60
	text = "#%d: %8s %3d %2d:%02d" % [score_index, score[2], score[0], minutes, seconds]
