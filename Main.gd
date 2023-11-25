extends Node2D
@export var scroll_speed = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If you change the position of the scene, everything else (it's children) will keep being relative to it
	position.x += scroll_speed * delta
	pass
