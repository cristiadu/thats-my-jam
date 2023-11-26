extends CanvasLayer

var current_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var err = $CountTimer.timeout.connect(on_CountTimer_timeout)
	if err:
		print("Error when linking HUD behavior")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func on_CountTimer_timeout():
	current_time += 1
	$TimeCounter.text = str(current_time) + "s"
