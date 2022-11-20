extends AnimatedSprite3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var wait_time = rand_range(0.0, 0.5)
	$StartTimer.start(wait_time)
	play(str(randi()%3))




func _on_StartTimer_timeout():
	$AnimationPlayer.play("cheer")
