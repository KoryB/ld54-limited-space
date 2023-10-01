# AutoLoad GameManager
extends Node


var total_score := 0.0


func _ready():
	randomize()


func goto_level(level, score):
	total_score += score
	print(total_score)
	get_tree().change_scene(level)
