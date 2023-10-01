# AutoLoad GameManager
extends Node


var total_score := 0.0


func goto_level(level, score):
	total_score += score
	get_tree().change_scene(level)
