extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	const animation_length = 1500
	var scale = (delta / animation_length) * 3
	var animation_delta = (delta / animation_length) * (2 * PI)

	scale = Vector2(scale, scale)
	rotation = animation_delta
	position.angle_to(self._calculate_position(animation_delta, animation_length))


func _calculate_position(animation_delta, animation_length):
	var t = animation_delta % (2 * PI)
	var a = sin(t) * animation_length
	return Vector2(0, cos(PI / 2) * a)
