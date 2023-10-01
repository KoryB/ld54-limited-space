class_name PreferenceGui

extends Control

var PreferenceLabelScene := preload("res://scene/guest/gui/preference_label.tscn")

export var preferences_path: NodePath
var preferences: Array


# Called when the node enters the scene tree for the first time.
func _ready():
	preferences = get_node(preferences_path).get_children()
	populate_preferences()


func populate_preferences():
	for preference in preferences:
		var label = PreferenceLabelScene.instance()
		label.text = preference.text
		
		get_node("%PreferenceContainer").add_child(label)
