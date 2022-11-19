extends Spatial


func _process(delta):
	$Label.text = 'has_ground_contact: ' + str($PlayerCage.has_ground_contact)
