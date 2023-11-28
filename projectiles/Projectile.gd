extends StaticBody2D
class_name Projectile

@export var projectile_damage = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("projectile")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_hit():
	queue_free()

func get_damage():
	return projectile_damage
