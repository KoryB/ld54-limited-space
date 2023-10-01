extends Area2D

signal pressed()
signal dragged(delta)
signal released()

export var is_global := true

var pressed := false
var previous_mouse_position := Vector2.ZERO

export(int, 1, 256) var button_index := BUTTON_LEFT

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("input_event", self, "_input_event")
	

func _process(delta: float):
	var delta_mouse = self.get_mouse_position() - self.previous_mouse_position
	self.previous_mouse_position = self.get_mouse_position()
	
	if not Input.is_mouse_button_pressed(button_index):
		pressed = false
		emit_signal("released")
	
	if self.pressed and not delta_mouse.is_equal_approx(Vector2.ZERO):
		emit_signal("dragged", delta_mouse)


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and \
		event.button_index == button_index and \
		event.is_pressed():

		self.pressed = true
		self.previous_mouse_position = self.get_mouse_position()
		emit_signal("pressed", self.previous_mouse_position)
		
		
func get_mouse_position():
	if self.is_global:
		return get_global_mouse_position()
	else:
		return get_local_mouse_position()
