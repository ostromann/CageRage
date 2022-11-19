extends Spatial


var has_ground_contact : bool = false


func _physics_process(delta):
	var overlapping_bodies = $Diagonal/Area.get_overlapping_bodies()
	
	if overlapping_bodies:
		for overlapping_body in overlapping_bodies:
			has_ground_contact = true
	else:
		has_ground_contact = false
