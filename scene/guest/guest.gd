tool
class_name Guest

extends Node2dDraggable

# Font: https://www.fontspace.com/honeybee-font-f17702

enum ShapeType { CIRCLE, SQUARE, TRIANGLE }

export var guest_name = "Hector"
export(ShapeType) var shape_type := ShapeType.CIRCLE
export(Color, RGB) var color := Color.white

export var walk_radius := 128.0
export var walk_time_min := 2.0
export var walk_time_max := 2.0
export var walk_speed := 32.0

onready var preferences := $Preferences.get_children()

var is_gui_toggle := false

var is_seated := false
var is_waiting := true
var is_walking := false
var walk_target := Vector2.ZERO
var origin := Vector2.ZERO
var walk_timer := 0.0


func _ready():
	get_node("PreferenceGui/ScrollContainer").get_v_scrollbar().rect_scale.x = 0

	update_sprite()
	origin = self.position
	enter_wait()


func _process(delta: float):
	if Engine.editor_hint:
		update_sprite()
	else:
		$PreferenceGui.visible = self.should_show_gui()
		if not is_seated:
			if is_waiting:
				if walk_timer > 0 and walk_timer - delta <= 0:
					walk_timer = 0
					is_waiting = false
					is_walking = true
					var offset = Vector2(cos(randf()*2*PI), sin(randf()*2*PI)) * randf()*self.walk_radius
					walk_target = self.origin + offset
				else:
					walk_timer -= delta
					
			if is_walking:
				var dir = (walk_target - self.position).normalized()
				self.position += dir * self.walk_speed * delta
				
				if (self.position - walk_target).length() < 2.0:
					enter_wait()


func calculate_score(neighbors: Neighbors) -> float:
	var sum = 0
	
	for preference in preferences:
		sum += preference.calculate_score(neighbors)
		
	return sum


func get_seat_area() -> Area2D:
	return $SeatArea as Area2D
	
	
func on_press(mouse_position: Vector2):
	$Sprite.modulate.a = 0.5
	is_waiting = false
	is_walking = false
	
	.on_press(mouse_position)
	
	
func on_release():
	$Sprite.modulate.a = 1.0
	self.origin = self.position
	enter_wait()
	
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
	

func enter_wait():
	self.is_waiting = true
	self.is_walking = false
	self.walk_timer = rand_range(self.walk_time_min, self.walk_time_max)
