extends RigidBody


export var MAX_JUMP_IMPULSE = 80
export var LATERAL_SPEED = 200
export var JUMP_CHARGE_FACTOR = 2.0 # per second charges up to 1.0
export var GRAVITY = 9.81
export var ACCELERATION = 10

const UP = Vector3.UP

var direction = Vector3.ZERO
var velocity = Vector3.ZERO
var jump_charge = 0.0
var is_charging = false


func _ready():
	pass # Replace with function body.

func _process(delta):
	update_jump_progress_bar()


func update_jump_progress_bar():
	$ProgressBar.value = jump_charge
	
func _physics_process(delta):
	direction = get_direction()
	roll(delta)
	jump(delta)
	
	
func jump(delta):
	if Input.is_action_pressed("jump"):
		is_charging = true
		jump_charge += JUMP_CHARGE_FACTOR * delta
		jump_charge = clamp(jump_charge, 0, 1)
	elif Input.is_action_just_released("jump"):
		is_charging = false
		apply_central_impulse(Vector3.UP * jump_charge * MAX_JUMP_IMPULSE)
		jump_charge = 0
	
func get_direction():
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	return direction
	
func roll(delta):
	add_central_force(Vector3.RIGHT * direction.x * delta * 2000)
#
#
#func animate():
#	# TODO: Figure this out
#	if jump_charge > 0 and jump_charge < 1.0:
#		$AnimationPlayer.play("charging")
#	elif jump_charge == 1.0:
#		$AnimationPlayer.play("charged")
#	else:
#		$AnimationPlayer.play("RESET")
