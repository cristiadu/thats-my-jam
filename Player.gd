extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -600.0

signal lost_life

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	move_player(delta)
	move_and_slide()
	var collision = get_last_slide_collision()
	if collision != null:
		on_player_collision(collision)
	

func move_player(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
func on_player_collision(collision: KinematicCollision2D):
	var body = collision.get_collider()
	if body.is_in_group("blockage") or body.is_in_group("projectile"):
		body.on_hit()
		lost_life.emit(body.get_damage())
	
