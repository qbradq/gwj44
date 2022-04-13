extends TextureButton

func _ready():
	update_button_texture()

func _on_MuteButton_pressed():
	$AudioStreamPlayer.play()
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
	update_button_texture()

func update_button_texture():
	if AudioServer.is_bus_mute(0):
		texture_normal = preload("res://Art/TextureButtons/mute.png")
	else:
		texture_normal = preload("res://Art/TextureButtons/sound.png")
