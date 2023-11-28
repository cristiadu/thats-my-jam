extends Node2D
class_name Enemy

@export var enemy_y_position = 600
@export var projectile_interval = 10

var sprite: Sprite2D

func _ready():
	sprite = $Sprite2D 
	$ProjectileTimer.start(projectile_interval)
	var err = $ProjectileTimer.timeout.connect(shoot_projectile)
	if err:
		print("Error when linking Projectile behavior")

func _process(delta):
	var cameraRect : Vector2 = get_parent().get_node("GameCamera").get_target_position()
	# Delete Enemy from memory when the GameCamera passes it.
	if cameraRect.x - sprite.position.x*2 > position.x:
		queue_free()

func set_enemy_y_position(pos):
	enemy_y_position = pos
	
func get_enemy_type():
	return "Enemy"

func shoot_projectile():
	# Implement at each enemy level
	print("Im shooting now, pew pew! " + get_enemy_type())
	pass
