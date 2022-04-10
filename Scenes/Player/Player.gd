extends Area2D

const SPEED:float = 100.0

var sparks_scene:PackedScene = load("res://Scenes/Bits/Sparks.tscn")
var default_gun_scene:PackedScene = load("res://Scenes/Gun/Gun.tscn")

var velocity:Vector2
var default_gun:Node2D

func _ready():
	add_to_group("player")
	default_gun = default_gun_scene.instance()
	default_gun.infinite_ammo = true
	change_gun(default_gun)

func _physics_process(delta):
	# Movement
	var invel:Vector2
	invel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	invel.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	invel = invel.normalized() * SPEED
	global_position += invel * delta
	look_at(get_global_mouse_position())
	# Bounding
	if global_position.x < 8:
		global_position.x = 8
	if global_position.x > 312:
		global_position.x = 312
	if global_position.y < 8:
		global_position.y = 8
	if global_position.y > 172:
		global_position.y = 172	
	# Shooting
	if Input.is_mouse_button_pressed(1):
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
	# Create sparkes explosion
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
