extends RigidBody


func _physics_process(delta):
	var sword_pos = Input.get_action_strength("sword_up") - Input.get_action_strength("sword_down")
	rotation_degrees.z = -sword_pos * 45

