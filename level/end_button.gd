extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_pressed")


func _pressed():
	GameManager.total_score = 0
	get_tree().change_scene("res://level/levels/0.tscn")
