class_name Seat

extends Node2D


var is_occupied := false
var occupant: Guest


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func is_guest_overlapping(guest: Guest) -> bool:
	for area in $Area2D.get_overlapping_areas():
		if area == guest.get_seat_area():
			return true
			
	return false
	
func occupy(guest: Guest):
	assert(occupant == null)
	
	self.is_occupied = true
	self.occupant = guest
	self.occupant.is_seated = true
	
	self.occupant.connect("pressed", self, "forget_occupant")

	guest.global_position = self.global_position


func forget_occupant():
	if self.occupant != null:
		self.occupant.is_seated = false
		
	self.is_occupied = false
	self.occupant = null
	
