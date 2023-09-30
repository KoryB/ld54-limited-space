class_name TableWithSeats

extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Returns true if the guest is placed in a seat
func place_guest(guest: Guest):
	for seat in $Seats.get_children():
		if not seat.is_occupied and seat.is_guest_overlapping(guest):
			seat.occupy(guest)
			return true
	
	return false
