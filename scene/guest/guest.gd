class_name Guest

extends Node2D

signal pressed()
signal released()

var pressed_position: Vector2
var is_dragging := false

func _ready():
	$DragArea.connect("pressed", self, "on_press")
	$DragArea.connect("dragged", self, "on_drag")
	$DragArea.connect("released", self, "on_release")
	

func get_seat_area() -> Area2D:
	return $SeatArea as Area2D
	

func on_press():
	pressed_position = self.position
	is_dragging = true
	
	emit_signal("pressed")

func on_drag(delta: Vector2):
	self.position += delta

func on_release():
	self.modulate.a = 1.0
	is_dragging = false
	
	emit_signal("released")
