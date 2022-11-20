extends Node

var level_list = [
	"res://Level/Level1.tscn",
#	"res://Level/Level2.tscn",
#	"res://Level/Level3.tscn", 
	]
var level_index : int = 0
var is_playing : bool = false

const START_MENU = preload("res://Level/MainMenuBackdrop.tscn")
const END_MENU = preload("res://Level/EndMenuBackdrop.tscn")

onready var current_level = $MainMenuBackdrop

func _ready():
	pass
#	add_to_group("GLOBAL")

func _process(delta):
	if Input.is_action_just_pressed("ui_start"):
		get_tree().change_scene("res://UI/MainMenu.tscn")

	
func next_level():
	print('Called next level')
	print(level_list, level_index)
	if level_index < level_list.size():
		print('loading ', level_list[level_index])
		var next_level = load(level_list[level_index]).instance()
		next_level.connect("level_done", self, "next_level")
		current_level.queue_free()
		add_child(next_level)
		current_level = next_level
		level_index += 1
	else:
		load_end_screen()
		
func load_start_screen():
	var next_level = START_MENU.instance()
	current_level.queue_free()
	add_child(next_level)
	current_level = next_level
	$EndScreen.hide()
	$StartScreen.show()

func load_end_screen():
	var next_level = END_MENU.instance()
	current_level.queue_free()
	add_child(next_level)
	current_level = next_level
	$EndScreen.show()
	$StartScreen.hide()
	

func _on_StartButton_pressed():
	print('Game entered!')
	$StartScreen.hide()
	next_level()


func _on_RestartButton_pressed():
	level_index = 0
	$EndScreen.hide()
	load_start_screen()
	
