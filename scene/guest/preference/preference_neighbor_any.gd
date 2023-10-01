extends GuestPreference

export var scale := 100.0
export var baseline := 0.0


func calculate_score(other_guests: Neighbors) -> float:
	var score = baseline
	
	if other_guests.left != null:
		score += scale
	
	if other_guests.right != null:
		score += scale
		
	return score
