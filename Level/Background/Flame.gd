extends Spatial


# Called when the node enters the scene tree for the first time.
func _ready():
	var wait_time = rand_range(0.0, 0.5)
	$StartTimer.start(wait_time)


func _on_StartTimer_timeout():
	$AnimationPlayer.play("New Anim")
