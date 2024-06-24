extends Node2D
class_name Character

@export var is_player : bool
@export var current_hp : int = 25
@export var max_hp : int = 25

@export var combat_actions : Array
@export var opponents : Node

@onready var health_bar : ProgressBar = get_node("HealthBar")
@onready var health_text : Label = get_node("HealthBar/HealthText")


@export var visual : Texture2D
@export var flip_visual : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = visual
	$Sprite.flip_h = flip_visual
	
	get_node("/root/BattleScene").character_begin_turn.connect(on_character_begin_turn)
	health_bar.max_value = max_hp
	update_health_bar()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage):
	current_hp -= damage
	update_health_bar()
	if current_hp <= 0:
		get_node("/root/BattleScene").character_died(self)
		queue_free()

func heal(amount):
	current_hp += amount
	
	if current_hp > max_hp:
		current_hp = max_hp
	
	update_health_bar()

func update_health_bar():
	health_bar.value = current_hp
	health_text.text = str(current_hp, "/",max_hp)
	
func on_character_begin_turn(character):
	pass
