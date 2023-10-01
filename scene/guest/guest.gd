tool
class_name Guest

extends Node2dDraggable

# Font: https://www.fontspace.com/honeybee-font-f17702

enum ShapeType { CIRCLE, SQUARE, TRIANGLE }

export(ShapeType) var shape_type := ShapeType.CIRCLE
export(Color, RGB) var color := Color.white

onready var preferences := $Preferences.get_children()

var is_gui_toggle := false


func _ready():
	get_node("PreferenceGui/ScrollContainer").get_v_scrollbar().rect_scale.x = 0

	update_sprite()


func _process(_delta: float):
	if Engine.editor_hint:
		update_sprite()
	else:
		$PreferenceGui.visible = self.should_show_gui()


func calculate_score(neighbors: Neighbors) -> float:
	var sum = 0
	
	for preference in preferences:
		sum += preference.calculate_score(neighbors)
		
	return sum


func get_seat_area() -> Area2D:
	return $SeatArea as Area2D
	
	
func on_press(mouse_position: Vector2):
	$Sprite.modulate.a = 0.5
	
	.on_press(mouse_position)
	
	
func on_release():
	$Sprite.modulate.a = 1.0
	
	.on_release()
	

func on_click():
	self.is_gui_toggle = not self.is_gui_toggle
	$PreferenceGui.modulate.a = 1.0 if self.is_gui_toggle else 0.6666
	
	.on_click()
	
	
func update_sprite():
	$Sprite/Triangle.visible = false
	$Sprite/Square.visible = false
	$Sprite/Circle.visible = false
	
	if shape_type == ShapeType.CIRCLE:
		$Sprite/Circle.visible = true
	elif shape_type == ShapeType.SQUARE:
		$Sprite/Square.visible = true
	elif shape_type == ShapeType.Triangle:
		$Sprite/Triangle.visible = true
		
	$Sprite.modulate = color
	
	
func should_show_gui():
	return self.is_gui_toggle or $DragArea.is_mouse_hover
