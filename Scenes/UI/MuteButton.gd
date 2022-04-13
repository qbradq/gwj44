extends TextureButton

func _on_MuteButton_pressed():
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
	if AudioServer.is_bus_mute(0):
		texture_normal = preload("res://Art/TextureButtons/mute.png")
	else:
		texture_normal = preload("res://Art/TextureButtons/sound.png")
