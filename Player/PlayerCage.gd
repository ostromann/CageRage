extends Spatial


var has_ground_contact : bool = false
var top_has_ground_contact : bool = false
var bottom_has_ground_contact : bool = false
var left_has_ground_contact : bool = false
var right_has_ground_contact : bool = false


func _physics_process(delta):
	var overlapping_bodies = $Diagonal/Area.get_overlapping_bodies()
	
	if overlapping_bodies:
		for overlapping_body in overlapping_bodies:
#			print('overlapping body: ', overlapping_body.global_translation.y, ' us: ', global_translation.y)
			has_ground_contact = true
	else:
		has_ground_contact = false
#	has_ground_contact = top_has_ground_contact or bottom_has_ground_contact or left_has_ground_contact or right_has_ground_contact
#	print('top ', str(top_has_ground_contact), ' right ', str(right_has_ground_contact), ' bottom ', str(bottom_has_ground_contact),  ' left ', str(left_has_ground_contact))


func _on_Bottom_body_entered(body):
	bottom_has_ground_contact = true
	
func _on_Bottom_body_exited(body):
	bottom_has_ground_contact = true

func _on_Top_body_entered(body):
	top_has_ground_contact = true
	
func _on_Top_body_exited(body):
	top_has_ground_contact = false

func _on_Right_body_entered(body):
	right_has_ground_contact = true

func _on_Right_body_exited(body):
	right_has_ground_contact = false

func _on_Left_body_entered(body):
	left_has_ground_contact = true

func _on_Left_body_exited(body):
	left_has_ground_contact = false
