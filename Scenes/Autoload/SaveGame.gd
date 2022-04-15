extends Node


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_data()


func save_data():
	var save_dict := {
		"scores": HighScores.scores,
		"mute": AudioServer.is_bus_mute(0)
	}
	var f := File.new()
	f.open("user://save.dat", File.WRITE)
	f.store_var(save_dict)
	f.close()


func load_data():
	var f := File.new()
	if not f.file_exists("user://save.dat"):
		return
	f.open("user://save.dat", File.READ)
	var save_dict:Dictionary = f.get_var()
	f.close()
	HighScores.scores = save_dict["scores"]
	if save_dict["mute"]:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
