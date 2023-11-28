extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var err = $GameCamera/Player.lost_life.connect(on_lost_life)
	if err:
		print("Error when linking behavior of losing a life")
		
	err = $HUD.game_over.connect(on_game_over)
	if err:
		print("Error when linking behavior of game over")
		
func on_lost_life(damage):
	print("You lost a life! The damage: " + str(damage))
	$HUD.life_lost(damage)
	
func on_game_over():
	print("Game over man!")
	get_tree().paused = true
