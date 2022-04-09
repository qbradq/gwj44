extends Control

func _ready():
	randomize()

func _on_QuitButton_pressed():
	$AudioStreamPlayer.play()
	$AudioTimer.connect("timeout", self, "quit")
	$AudioTimer.start()

func quit():
	get_tree().quit()

func _on_StartButton_pressed():
	$AudioStreamPlayer.play()
	$AudioTimer.connect("timeout", self, "start")
	$AudioTimer.start()

func start():
	get_tree().change_scene("res://Scenes/Level/Level.tscn")
