extends StaticBody2D

@export var collision_damage = 1

func _process(delta):
	var cameraRect : Vector2 = get_parent().get_node("GameCamera").get_target_position()
	# Delete Enemy from memory when the GameCamera passes it.
	if cameraRect.x - $Sprite2D.position.x*2 > position.x:
		queue_free()


func get_enemy_type():
	return "CatEnemy"
