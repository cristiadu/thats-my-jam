extends CanvasLayer

var current_time = 0

var lives = 3

signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	var err = $CountTimer.timeout.connect(on_CountTimer_timeout)
	if err:
		print("Error when linking HUD behavior")

	
func on_CountTimer_timeout():
	current_time += 1
	$TimeCounter.text = str(current_time) + "s"


func life_lost(damage):
	for i in range(0, damage):		
		get_node("Lives/Heart" + str(lives) + "/AnimatedSprite2D").animation = "empty"
		lives-=1
		
		if lives == 0:
			game_over.emit()
			break
