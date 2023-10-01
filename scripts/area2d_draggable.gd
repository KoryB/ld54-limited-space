extends Area2D

signal pressed()
signal dragged(delta)
signal released()

signal clicked()

export var is_global := true
export var action_name := "primary_click"

var pressed := false
var previous_mouse_position := Vector2.ZERO
var is_click := false
var is_mouse_hover := false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("mouse_entered", self, "_mouse_entered")
	self.connect("mouse_exited", self, "_mouse_exited")
	

func _process(delta: float):
	var delta_mouse = self.get_mouse_position() - self.previous_mouse_position
	self.previous_mouse_position = self.get_mouse_position()
	
	if self.pressed and Input.is_action_just_released(action_name):
		pressed = false
		emit_signal("released")
		
		if self.is_click:
			emit_signal("clicked")
	
	if self.pressed and not delta_mouse.is_equal_approx(Vector2.ZERO):
		self.is_click = false
		emit_signal("dragged", delta_mouse)
		
	
	calculate_mouse_hover()
	
	if self.is_mouse_hover and Input.is_action_just_pressed(action_name):
		self.pressed = true
		self.is_click = true
		self.previous_mouse_position = self.get_mouse_position()
		emit_signal("pressed", self.previous_mouse_position)
		
		
func get_mouse_position():
	if self.is_global:
		return get_global_mouse_position()
	else:
		return get_local_mouse_position()
		
func calculate_mouse_hover():
	var mouse_shape = CircleShape2D.new()
	mouse_shape.radius = 0.1
	
	self.is_mouse_hover = $CollisionShape2D.shape.collide(
		self.global_transform,
		mouse_shape,
		Transform2D.IDENTITY.translated(get_global_mouse_position()))
