class_name PreferenceGui

extends Control

var PreferenceLabelScene := preload("res://scene/guest/gui/preference_label.tscn")

export var guest_path: NodePath
export var preferences_path: NodePath
var guest: Guest
var preferences: Array


# Called when the node enters the scene tree for the first time.
func _ready():
	guest = get_node(guest_path)
	preferences = get_node(preferences_path).get_children()
	populate_name()
	populate_preferences()


func populate_name():
	get_node("%Name").text = guest.guest_name


func populate_preferences():
	for preference in preferences:
		var label = PreferenceLabelScene.instance()
		label.text = preference.text
		
		get_node("%PreferenceContainer").add_child(label)
