extends Node2D

var bullet_scene:PackedScene = preload("res://Scenes/Player/PlayerBullet.tscn")

export var shot_cooldown_time:float = 0.25
export var ammo:int = 100
export var infinite_ammo:bool = false

var shoot_cooldown:float

func shoot(delta):
	shoot_cooldown -= delta
	while shoot_cooldown <= 0.0:
		shoot_cooldown += shot_cooldown_time
		shoot_bullet()


func shoot_bullet():
	if ammo <= 0:
		return
	if not infinite_ammo:
		ammo -= 1
	$FireAudio.play()
	var bullet = bullet_scene.instance()
	bullet.global_transform = global_transform
	get_parent().get_parent().add_child(bullet)

func reset():
	shoot_cooldown = 0.0

func has_ammo()->bool:
	return ammo > 0
