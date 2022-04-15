extends Label


export var score_index:int = 1


func _ready():
	var score = HighScores.scores[score_index-1]
	text = "#%d: %03d %s" % [score_index, score[0], score[1]]
