extends GuestPreference


export(NodePath) var preference_path
onready var preference = get_node(preference_path)
export var scale := 100.0
export var baseline := 0.0


func calculate_score(other_guests: Neighbors) -> float:
	var score = baseline
	
	if other_guests.across != null and other_guests.across == self.preference:
		print(self.preference.name + ',' + other_guests.across.name)
		score += scale
		
	return score
