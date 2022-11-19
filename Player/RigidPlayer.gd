extends Spatial


func _process(delta):
	$Label.text = 'has_ground_contact: ' + str($PlayerCage.has_ground_contact)
	if $PlayerCage.has_ground_contact:
		$PlayerBall.can_jump = true
	else:
		$PlayerBall.can_jump = false
