extends Area2D


const SPEED:float = 100.0


var sparks_scene:PackedScene = load("res://Scenes/Bits/Sparks.tscn")
var default_gun_scene:PackedScene = load("res://Scenes/Gun/Gun.tscn")


var velocity:Vector2
var default_gun:Node2D
var track_mouse:bool


func _ready():
	add_to_group("player")
	default_gun = default_gun_scene.instance()
	default_gun.infinite_ammo = true
	change_gun(default_gun)


func _input(event):
	if event is InputEventMouseMotion:
		track_mouse = true


func _physics_process(delta):
	# Movement
	var invel := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	invel = invel.normalized() * SPEED
	global_position += invel * delta
	# Bounding
	if global_position.x < 8:
		global_position.x = 8
	if global_position.x > 312:
		global_position.x = 312
	if global_position.y < 8:
		global_position.y = 8
	if global_position.y > 172:
		global_position.y = 172
	# Mouselook
	if track_mouse:
		look_at(get_global_mouse_position())
	# Shooting
	if Input.is_mouse_button_pressed(1):
		$Gun.shoot(delta)
		if not $Gun.has_ammo():
			change_gun(default_gun)
	else:
		track_mouse = false
		var fvect := Input.get_vector("fire_left", "fire_right", "fire_up", "fire_down")
		if fvect.length_squared() != 0:
			look_at(global_position + fvect)
			$Gun.shoot(delta)
			if not $Gun.has_ammo():
				change_gun(default_gun)
		else:
			$Gun.reset()


func die():
	# Play death audio and make it persistent
	var pa = $PowAudio
	if pa != null:
		remove_child(pa)
		get_parent().find_node("AudioTemp").add_child(pa)
		pa.play()
	# Create sparks explosion
	var sparks = sparks_scene.instance()
	sparks.global_position = global_position
	sparks.restart()
	get_parent().add_child(sparks)
	# Timer
	LevelData.stop_timing()
	get_parent().find_node("AfterDeathTimer").start()
	queue_free()


func _on_Player_area_entered(area):
	if area.is_in_group("enemy"):
		area.die()
		die()


func change_gun(new_gun):
	remove_child($Gun)
	if new_gun.get_parent():
		new_gun.get_parent().remove_child(new_gun)
	new_gun.name = "Gun"
	new_gun.position = Vector2.ZERO
	add_child(new_gun)
