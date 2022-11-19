extends StaticBody


export var MOVE_DIRECTION = Vector3.UP
export var MAX_DISTANCE = 10
export var MOVEMENT_SPEED = 2

onready var origin = global_translation
var direction = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	translation += MOVE_DIRECTION * MOVEMENT_SPEED * delta * direction
	if origin.distance_to(global_translation) > MAX_DISTANCE:
		direction *= -1
	elif origin.distance_to(global_translation) < 0.1:
		direction *= -1
