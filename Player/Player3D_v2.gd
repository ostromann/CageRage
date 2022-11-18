extends KinematicBody


export var MAX_JUMP_SPEED = 10
export var LATERAL_SPEED = 200
export var JUMP_CHARGE_FACTOR = 2.0 # per second charges up to 1.0
export var GRAVITY = 9.81
export var ACCELERATION = 10

const UP = Vector3.UP

var direction = Vector3.ZERO
var velocity = Vector3.ZERO
var jump_charge = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	update_jump_progress_bar()
	

func update_jump_progress_bar():
	$ProgressBar.value = jump_charge
	
func _physics_process(delta):
	var direction = get_direction() 
	update_velocity(direction, delta)
	apply_gravity(delta)
	jump(delta)
	var _move = move_and_slide(velocity,UP)
	move_and_slide(velocity, UP)
	$Label.text = 'is_on_floor: ' +str(is_on_floor())
	
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	else: 
		velocity.y = 0
	
	
func jump(delta):
	if Input.is_action_pressed("jump"):
		jump_charge += JUMP_CHARGE_FACTOR * delta
	elif Input.is_action_just_released("jump"):
		translation.y = 0.1
		velocity.y += MAX_JUMP_SPEED * clamp(jump_charge,0,1.0)
		# Get the jump direction
		jump_charge = 0
	
func get_direction():
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	return direction


func update_velocity(direction, delta):
	print(translation)
	if translation.y <= 2.001: #TODO: Figure out if we're on the ground
		velocity.x = 0
	else:
		velocity.x = direction.x * LATERAL_SPEED * delta
