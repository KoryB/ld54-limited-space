class_name Guest

extends Node2dDraggable


onready var preferences := $Preferences.get_children()

func calculate_score(neighbors: Neighbors) -> float:
	var sum = 0
	
	for preference in preferences:
		sum += preference.calculate_score(neighbors)
		
	return sum


func get_seat_area() -> Area2D:
	return $SeatArea as Area2D
	
	
func on_press(mouse_position: Vector2):
	self.modulate.a = 0.5
	
	.on_press(mouse_position)
	
	
func on_release():
	self.modulate.a = 1.0
	
	.on_release()
