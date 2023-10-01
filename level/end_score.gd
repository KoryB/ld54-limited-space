extends Label

func _ready():
	self.text = "Final Score: " + str(GameManager.total_score)
