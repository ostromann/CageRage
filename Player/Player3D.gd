extends KinematicBody


export var MAX_JUMP_SPEED = 20
export var JUMP_CHARGE_FACTOR = 0.5 # per second charges up to 1.0
export var GRAVITY = 4

var direction = Vector3.ZERO
var velocity = Vector3.ZERO
var jump_charge = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func apply_gravity(delta):
	pass
#	velocity.y -= GRAVITY * delta
	

func _physics_process(delta):
	pass
#	apply_gravity(delta)
#	if Input.is_action_pressed("jump"):
#		jump_charge += JUMP_CHARGE_FACTOR * delta
#	elif Input.is_action_just_released("jump"):
#		jump_charge = 0
#		velocity.y += MAX_JUMP_SPEED * jump_charge
#
#	move_and_slide(velocity)
#	print(velocity)
