extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var score := 0.0
	
	for table in get_node("%Tables").get_children():
		score += table.calculate_score()
		
	self.text = "Score: " + str(score)
