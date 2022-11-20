extends Node

var level_list = [
	"res://Level/Level1.tscn",
	"res://Level/Level1.1.tscn",
	"res://Level/Level2.tscn",
	"res://Level/Level3.0.tscn",
	"res://Level/Level3.tscn", 
#	"res://Level/Level4.tscn", 
#	"res://Level/Level5.tscn", 
#	"res://Level/Level6.tscn", 
#	"res://Level/Level7.tscn", 
	"res://Level/Level8.tscn", 
	"res://Level/Level9.tscn", 
	"res://Level/Level10.tscn", 
	]
var level_index : int = 0
var is_playing : bool = false
#var shows_winning_screen : bool = false

const START_MENU = preload("res://Level/MainMenuBackdrop.tscn")
const END_MENU = preload("res://Level/EndMenuBackdrop.tscn")

onready var current_level = $MainMenuBackdrop

func _ready():
	$AudioStreamPlayer.play()
	pass
#	add_to_group("GLOBAL")

func _process(delta):
	pass

#	if Input.is_action_just_pressed("ui_start"):
#		get_tree().change_scene("res://UI/MainMenu.tscn")

	
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
	$VictoryAudioStreamPlayer.stop()
	$AudioStreamPlayer.play()
	var next_level = START_MENU.instance()
	current_level.queue_free()
	add_child(next_level)
	current_level = next_level
	$EndScreen.hide()
	$StartScreen.show()

func load_end_screen():
	$AudioStreamPlayer.stop()
	$VictoryAudioStreamPlayer.play()
	$ShowEndScreenTimer.start()
	var next_level = END_MENU.instance()
	current_level.queue_free()
	add_child(next_level)
	current_level = next_level
	$StartScreen.hide()
	

func _on_StartButton_pressed():
	print('Game entered!')
	$StartScreen.hide()
	next_level()


func _on_RestartButton_pressed():
	level_index = 0
	$EndScreen.hide()
	load_start_screen()

func _on_ShowEndScreenTimer_timeout():
	$EndScreen.show()
