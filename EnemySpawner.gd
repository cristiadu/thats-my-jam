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

func _ready():
	var err = $SpawnTimer.timeout.connect(on_SpawnTimer_timeout)
	if err:
		print("Error when linking HUD delete behavior")
	
	randomize() 
	camera_width = get_viewport_rect().end.x
	$SpawnTimer.start(next_spawn_time)
	
	
func on_SpawnTimer_timeout():
	# Spawn an enemy
	var enemyPreload = preloadedEnemies[randi() % preloadedEnemies.size()]
	var enemy: Enemy = enemyPreload.instantiate()

	var cameraRect : Vector2 = get_parent().get_target_position()
	var xPos: int = randi_range(cameraRect.x, cameraRect.x + camera_width)
	print(enemy.enemy_y_position)
	enemy.position = Vector2(xPos, enemy.enemy_y_position)
	get_parent().add_sibling(enemy)
	
	# Restart the timer
	next_spawn_time -= time_decrease
	if next_spawn_time < MIN_SPAWN_TIME:
		next_spawn_time = MIN_SPAWN_TIME
	$SpawnTimer.start(next_spawn_time)
