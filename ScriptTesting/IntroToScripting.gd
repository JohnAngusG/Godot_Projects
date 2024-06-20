extends Node2D

var score : int = 0
var move_speed : float = 1.5
var game_over : bool = true
var ability : String = "slash"


var time_left = 5



# Called when the node enters the scene tree for the first time.
func _ready():
	move_speed+= 2.4
	print(5 == 5)
	_welcome_message()
	print(_add(2,5))

func _welcome_message():
	print("Hello world!")
	
func _add(a,b):
	var sum = a + b
	return sum

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_left -= delta
	print(time_left)
