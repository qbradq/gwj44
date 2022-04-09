extends Area2D

const SPEED:float = 100.0

var bullet_scene:PackedScene = preload("res://Scenes/PlayerBullet.tscn")
var sparks_scene:PackedScene = load("res://Scenes/Sparks.tscn")

var shot_cooldown_time:float = 0.25

var velocity:Vector2
var shoot_cooldown:float

func _ready():
	add_to_group("player")

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
		shoot_cooldown -= delta
		while shoot_cooldown <= 0.0:
			shoot_cooldown += shot_cooldown_time
			shoot()
	else:
		shoot_cooldown = 0.0

func shoot():
	$PewAudio.play()
	var bullet = bullet_scene.instance()
	bullet.global_transform = global_transform
	get_parent().add_child(bullet)

func die():
	var pa = $PowAudio
	remove_child(pa)
	get_parent().find_node("AudioTemp").add_child(pa)
	pa.play()
	var sparks = sparks_scene.instance()
	sparks.global_position = global_position
	sparks.restart()
	get_parent().add_child(sparks)
	get_parent().find_node("AfterDeathTimer").start()
	queue_free()

func _on_Player_area_entered(area):
	if area.is_in_group("enemy"):
		area.die()
		die()
