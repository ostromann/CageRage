extends AnimatedSprite3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var wait_time = rand_range(0.0, 0.5)
	print('Wait time is set to ', wait_time)
	$StartTimer.start(wait_time)
	play(str(randi()%3))




func _on_StartTimer_timeout():
	print('start animation')
	$AnimationPlayer.play("cheer")
