extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var sword_pos = Input.get_action_strength("sword_up") - Input.get_action_strength("sword_down")

	
	rotation_degrees = sword_pos * 45
	print(rotation_degrees, ' ', sword_pos)
