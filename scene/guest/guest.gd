class_name Guest

extends Node2dDraggable

# Font: https://www.fontspace.com/honeybee-font-f17702

onready var preferences := $Preferences.get_children()

var is_gui_toggle := false


func _ready():
	get_node("PreferenceGui/ScrollContainer").get_v_scrollbar().rect_scale.x = 0


func _process(_delta: float):
	$PreferenceGui.visible = self.should_show_gui()


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
	

func on_click():
	self.is_gui_toggle = not self.is_gui_toggle
	
	.on_click()
	
	
func should_show_gui():
	return self.is_gui_toggle or $DragArea.is_mouse_hover
