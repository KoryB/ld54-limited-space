extends Node

export var tables_path: NodePath
export var guests_path: NodePath

var tables: Array
var guests: Array


# Called when the node enters the scene tree for the first time.
func _ready():
	tables = get_node(tables_path).get_children()
	guests = get_node(guests_path).get_children()
	
	for guest in guests:
		guest.connect("released", self, "on_guest_release", [guest])


func on_guest_release(guest: Guest):
	for table in tables:
		if table.place_guest(guest):
			break
