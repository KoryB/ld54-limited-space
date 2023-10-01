extends Button


export(String, FILE, "*.tscn") var next_level


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "on_pressed")


func on_pressed():
	GameManager.goto_level(next_level, get_node("%Score").score)
