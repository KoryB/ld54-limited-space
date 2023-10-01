extends GuestPreference


export(Guest.ShapeType) var preference
export var scale := 100.0
export var baseline := 0.0


func calculate_score(other_guests: Neighbors) -> float:
	var score = baseline
	
	if other_guests.left != null and other_guests.left.shape_type == self.preference:
		score += scale
	
	if other_guests.right != null and other_guests.right.shape_type == self.preference:
		score += scale
		
	return score
