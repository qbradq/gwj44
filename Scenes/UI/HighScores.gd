extends Control


var sidx:int


func _ready():
	$VBoxContainer/StartButton.grab_focus()
	# Figure out if we're storing this score
	if HighScores.is_high_score(LevelData.score):
		# UI setup
		$VBoxContainer/YouGotAHighScore.text = "YOU GOT A HIGH SCORE!"
		$VBoxContainer/NameEdit.text = "???"
		$VBoxContainer/NameEdit.show()
		$VBoxContainer/Spacer.hide()
		$VBoxContainer/NameEdit.grab_focus()
		sidx = HighScores.ingest_score(LevelData.score, int(LevelData.time_elapsed), "???")
		refresh_scores()
	else:
		# UI setup
		$VBoxContainer/YouGotAHighScore.text = "HIGH SCORES"
		$VBoxContainer/NameEdit.hide()
		$VBoxContainer/Spacer.show()
		var ltime = int(LevelData.time_elapsed)
		var minutes = ltime / 60
		var seconds = ltime % 60
		var t = "YOUR SCORE: %3d in %2d:%02d" % [LevelData.score, minutes, seconds]
		$VBoxContainer/Spacer.text = t


func _on_StartButton_pressed():
	$AudioStreamPlayer.play()
	SaveGame.save_data()
	yield($AudioStreamPlayer, "finished")
	get_tree().change_scene("res://Scenes/Level/Level.tscn")


func refresh_scores():
	$VBoxContainer/Score1.refresh()
	$VBoxContainer/Score2.refresh()
	$VBoxContainer/Score3.refresh()
	$VBoxContainer/Score4.refresh()
	$VBoxContainer/Score5.refresh()


func _on_NameEdit_text_changed(new_text):
	if sidx < 0:
		return
	HighScores.scores[sidx][2] = new_text
	refresh_scores()
