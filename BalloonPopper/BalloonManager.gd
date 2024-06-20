extends Node3D

var score : int = 0
@export var score_text: Label 
var balloon_scene = preload("res://Balloon.tscn")



func _increase_score (amount): 
	score += amount
	score_text.text = str("Score: ", score)

func create_balloon():
		var balloon = balloon_scene.instantiate()
		balloon.transform.origin = Vector3(randf_range(-2.5,3.0),randf_range(-2.0,3.0), 3.0)
		add_child(balloon)
		
		
		
