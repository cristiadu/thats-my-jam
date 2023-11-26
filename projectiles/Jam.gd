extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var animation_length = 1500
	var animation_delta = delta / animation_length
	var new_scale = animation_delta * 3

	scale = Vector2(scale.x + new_scale, scale.y + new_scale)
	rotation = rotation + animation_delta * (2 * PI)
	position = Vector2(position.x + (100 * delta), self._calculate_position(animation_delta, animation_length).y)


func _calculate_position(animation_delta, animation_length):
	var t = fmod(animation_delta, (2 * PI))
	var a = sin(t) * animation_length
	return Vector2(0, cos(PI / 2) * t)
