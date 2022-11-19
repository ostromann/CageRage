extends Node

var level_list = ["res://Level/Level1.tscn","res://Level/Level2.tscn","res://Level/Level3.tscn","res://Level/Level4.tscn","res://Level/Level5.tscn"]
var level_index = 0


func _ready():
#	add_to_group("GLOBAL")
	get_tree().change_scene(level_list[level_index])
	
func next_level():
	print('Called next level')
	level_index += 1
	if level_index <= level_list.size():
		get_tree().change_scene(level_list[level_index])
	else:
		queue_free()
