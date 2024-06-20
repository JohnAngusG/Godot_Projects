extends Area3D

@export var clicks_to_pop : int = 1
var score_to_give : int = 1
var size_increase : float = 0.015


func _on_input_event(_camera, event, _position, _normal, _shape_idx):
	if(event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
		clicks_to_pop-= 1
		if(clicks_to_pop == 0):
			get_node("/root/Main")._increase_score(_calculate_score(scale))
			get_node("/root/Main").create_balloon()
			queue_free()

func _process(_delta):
	scale += Vector3.ONE * size_increase

func _calculate_score(size):
	if size < Vector3(2.0,2.10,2.10):
		return 2
	else:
		return 1
