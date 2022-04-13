extends Area2D

var nearest_enemy
var velocity:Vector2
var speed:float = 250.0

func _ready():
	# Find nearest enemy
	var enemies = get_tree().get_nodes_in_group("enemy")
	var nearest_distance:float = 1000000.0
	for e in enemies:
		var d = global_position.distance_squared_to(e.global_position)
		if d < nearest_distance:
			nearest_distance = d
			nearest_enemy = e
	if nearest_enemy:
		nearest_enemy = weakref(nearest_enemy)
	else:
		queue_free()

func _physics_process(delta):
#	# Look at the nearest enemy
#	if nearest_enemy:
#		var e = nearest_enemy.get_ref()
#		if e:
#			look_at(e.global_position)
#			velocity = (Vector2.RIGHT * speed).rotated(rotation)
	# Slowly turn towards the nearest enemy
	if nearest_enemy:
		var e = nearest_enemy.get_ref()
		if e:
			rotation += get_angle_to(e.global_position) * 2.5 * PI * delta
			velocity = (Vector2.RIGHT * speed).rotated(rotation)
	# Dirty hack
	if velocity == Vector2.ZERO:
		queue_free()
	# Apply velocity
	global_position += velocity * delta
	# Screen bounding
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()

func _on_Missile_area_entered(area):
	if area.is_in_group("enemy"):
		area.die()
		queue_free()
