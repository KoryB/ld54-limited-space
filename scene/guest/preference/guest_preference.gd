class_name GuestPreference

extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func calculate_score(other_guests: Neighbors) -> float:
	return 1.0