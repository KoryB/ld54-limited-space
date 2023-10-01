extends GuestPreference


export(NodePath) var preference_path
onready var preference = get_node(preference_path)
export var scale := 100.0
export var baseline := 0.0


func calculate_score(other_guests: Neighbors) -> float:
	var score = baseline
	
	if other_guests.left != null and other_guests.left == self.preference:
		score += scale
	
	if other_guests.right != null and other_guests.right == self.preference:
		score += scale
		
	return score
