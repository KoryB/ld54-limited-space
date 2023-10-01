class_name Node2dDraggable

extends Node2D

signal pressed()
signal released()

export var should_center := true
export var should_invert := false

var pressed_position: Vector2
var is_dragging := false

func _ready():
	$DragArea.connect("pressed", self, "on_press")
	$DragArea.connect("dragged", self, "on_drag")
	$DragArea.connect("released", self, "on_release")
	

func on_press(mouse_position: Vector2):
	if should_center:
		self.position = mouse_position

	pressed_position = self.position
	is_dragging = true
	emit_signal("pressed")


func on_drag(delta: Vector2):	
	self.position += delta * (-1 if should_invert else 1)


func on_release():
	is_dragging = false
	
	emit_signal("released")
