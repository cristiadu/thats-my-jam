extends Node2D

@export var initial_spawn_time := 5.0
@export var time_decrease := 0.1

const MIN_SPAWN_TIME := 1.5
var next_spawn_time := initial_spawn_time
var camera_width

var preloadedEnemies := [
	preload("res://enemies/GrandmaEnemy.tscn"),
	preload("res://enemies/CompetitorEnemy.tscn"),
	preload("res://enemies/HungrySelfEnemy.tscn")
]

var preloadedBlockage := [
	preload("res://enemies/CatEnemy.tscn")
]

func _ready():
	var err = $SpawnTimer.timeout.connect(on_SpawnTimer_timeout)
	if err:
		print("Error when linking behavior")
	
	randomize() 
	camera_width = get_viewport_rect().end.x
	$SpawnTimer.start(next_spawn_time)
	
	
func on_SpawnTimer_timeout():
	var enemy
	var cameraRect : Vector2 = get_parent().get_target_position()
	var xPos: int = randi_range(cameraRect.x  + camera_width/4, cameraRect.x + camera_width)
	if randf() < 0.3:
		var blockPreload = preloadedBlockage[randi() % preloadedBlockage.size()]
		enemy = blockPreload.instantiate()
		enemy.position = Vector2(xPos, 700)
	else:
		# Spawn an enemy
		var enemyPreload = preloadedEnemies[randi() % preloadedEnemies.size()]
		enemy = enemyPreload.instantiate()
		enemy.position = Vector2(xPos, enemy.enemy_y_position)
		
	get_parent().add_sibling(enemy)
	
	# Restart the timer
	next_spawn_time -= time_decrease
	if next_spawn_time < MIN_SPAWN_TIME:
		next_spawn_time = MIN_SPAWN_TIME
	$SpawnTimer.start(next_spawn_time)
