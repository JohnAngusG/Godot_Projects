extends CharacterBody2D

var move_speed : float = 100.0
var jump_foce : float = 200.0
var gravity : float = 500.0


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.x = 0
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= move_speed
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += move_speed
	
	if (Input.is_key_pressed(KEY_SPACE) or Input.is_key_pressed(KEY_UP)) and is_on_floor():
		velocity.y = -jump_foce
	move_and_slide()

func game_over():
	get_tree().reload_current_scene()

func _process(delta):
	if global_position.y > 82:
		game_over()
