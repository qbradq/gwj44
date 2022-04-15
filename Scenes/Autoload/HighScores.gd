extends Node


var scores = [
	[100, "NORM"],
	[90, "NORM"],
	[80, "NORM"],
	[70, "NORM"],
	[60, "NORM"],
	[50, "NORM"],
	[40, "NORM"],
	[30, "NORM"],
	[20, "NORM"],
	[10, "NORM"],
]


func is_high_score(score)->bool:
	return score > scores[9][0]
