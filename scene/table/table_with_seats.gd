class_name TableWithSeats

extends Node2D


onready var preferences := $Preferences.get_children()


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
	
	
# Could have table level preferences here if we want
func calculate_score() -> float:
	var sum = 0.0
	var guests = []
	
	for seat in $Seats.get_children():
		guests.append(seat.occupant)
	
	for preference in preferences:
		sum += preference.calculate_score(guests)
		
	for guest in guests:
		if guest != null:
			var neighbors = NeighborsFactory.create(guest, guests)
			sum += guest.calculate_score(neighbors)
			
	return sum
