extends Node


var scores = [
	[100, 100, "URMOM"],
	[80, 80, "NORM"],
	[60, 60, "NORM"],
	[40, 40, "NORM"],
	[24, 17, "BOB"],
]


func is_high_score(score)->bool:
	return score >= scores[scores.size()-1][0]


func ingest_score(score, time, name):
	var s = [score, time, name]
	scores.push_back(s)
	scores.sort_custom(self, "score_sort")
	scores.remove(scores.size()-1)
	return scores.find(s)


func score_sort(a, b)->bool:
	return a[0] >= b[0]
