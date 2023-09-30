extends Area2D

signal pressed()
signal dragged(delta)
signal released()

var pressed := false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("input_event", self, "_input_event")
	

func _process(delta: float):
	var mouse = get_local_mouse_position()
	
	if not Input.is_mouse_button_pressed(BUTTON_LEFT):
		pressed = false
		emit_signal("released")
	
	if self.pressed and not mouse.is_equal_approx(Vector2.ZERO):
		emit_signal("dragged", mouse)


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and \
		event.button_index == BUTTON_LEFT and \
		event.is_pressed():

		self.pressed = true
		emit_signal("pressed")
