extends Spatial


func _process(delta):
	$Label.text = 'has_ground_contact: ' + str($PlayerCage.has_ground_contact)
	if $PlayerCage.has_ground_contact:
		$PlayerBall.can_jump = true
	else:
		$PlayerBall.can_jump = false
	animate()
		
func hurt():
	get_node("PlayerBall").get_node("CPUParticles").emitting = true
	$HurtAudioStreamPlayer.play()
	
func animate():
	if $PlayerBall.jump_charge > 0 and $PlayerBall.jump_charge < 1.0:
		charging()
	elif $PlayerBall.jump_charge == 1.0:
		fully_charged()
	else:
		not_charging()
	
func charging():
	$FlickeringAnimationPlayer.play('charging')

func fully_charged():
	$FlickeringAnimationPlayer.play("charged")

func not_charging():
	$FlickeringAnimationPlayer.play("RESET")
