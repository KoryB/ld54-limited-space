class_name Neighbors

extends Object


var all := []

var left setget ,get_left
var right setget ,get_right
var across setget ,get_across

func get_left():
	if all.size() == 0:
		return null
	else:
		return all[0]

func get_right():
	if all.size() == 0:
		return null
	else:
		return all[-1]
	
func get_across():
	if all.size() == 0:
		return null
	else:
		return all[all.size() / 2]
