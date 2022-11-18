extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jump_height = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up"):
		position.y -= jump_height
