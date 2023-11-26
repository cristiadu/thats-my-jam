extends Node2D
class_name Enemy

@export var enemy_y_position = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_enemy_y_position(pos):
	enemy_y_position = pos
