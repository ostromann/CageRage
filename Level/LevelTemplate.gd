extends Spatial


signal level_done()
export var next_level : String = ""
const RIGID_PLAYER = preload("res://Player/RigidPlayer.tscn")
var player


onready var current_checkpoint = $Checkpoints/Checkpoint


# Called when the node enters the scene tree for the first time.
func _ready():
	$FadingAnimations.play("fade_in")
	$FanfareAudioStreamPlayer.play()
	reset_level()



func _process(delta):
	if Input.is_action_just_pressed("reset_level"):
		reset_level()
	
#
#func _physics_process(delta):
#	$Camera.look_at(player.get_node('PlayerBall').global_translation,Vector3.UP)


func player_died():
	player.hurt()
	$CrowdLaughter.play()
	$CrowdCheer.play()
	print('Player fell into pit!')
	$RestartTimer.start()	
	


func _on_RestartTimer_timeout():
	reset_level()
	
func reset_level():
	if player:
		player.queue_free()
	spawn_player()
	
	
func spawn_player():
	player = RIGID_PLAYER.instance()
	player.translation = current_checkpoint.translation
	add_child(player)


func _on_Goal_body_entered(body):
	$CrowdBoo.play()
	print('Player won!')
	$FadeOutTimer.start()
	$FadingAnimations.play('fade_out')
	emit_signal("level_done")

func _on_FadeOutTimer_timeout():
	emit_signal("level_done")
