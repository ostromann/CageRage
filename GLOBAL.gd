extends Node

var level_list = ["res://Level/Level1.tscn","res://Level/Level2.tscn","res://Level/Level3.tscn","res://Level/Level4.tscn","res://Level/Level5.tscn"]
var level_index : int = 0
var is_playing : bool = false

onready var current_level = $Level1

func _ready():
#	add_to_group("GLOBAL")
	current_level.connect("level_done", self, "next_level")
#	get_tree().change_scene("res://UI/MainMenu.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_start"):
		get_tree().change_scene("res://UI/MainMenu.tscn")

	
func next_level():
	print('Called next level')
	level_index += 1
	if level_index <= level_list.size():
		print('Loading next level ', level_list[level_index])
		var next_level = load(level_list[level_index]).instance()
		next_level.connect("level_done", self, "next_level")
		current_level.queue_free()
		add_child(next_level)
		current_level = next_level	
	else:
		queue_free()
