extends Node

@export var player_char : Node
@export var enemy_char : Node
var curr_char : Character

@export var next_turn_delay : float = 1.0

var game_over : bool = false

signal character_begin_turn(character)
signal character_end_turn(character)

func _ready():
	begin_next_turn()

func begin_next_turn():
	if curr_char == player_char:
		curr_char = enemy_char
	elif curr_char == enemy_char:
		curr_char = player_char
	else:
		curr_char = player_char
	emit_signal("character_begin_turn", curr_char)

func end_current_turn():
	emit_signal("character_end_turn", curr_char)
	await get_tree().create_timer(next_turn_delay).timeout
	
	if !game_over:
		begin_next_turn()

func character_died(character):
	game_over = true
	if character.is_player == true:
		print("Game Over")
	else:
		print("You win!")
