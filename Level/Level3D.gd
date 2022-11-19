extends Spatial


const RIGID_PLAYER = preload("res://RigidPlayer/RigidPlayer.tscn")
var player


onready var current_checkpoint = $Checkpoints/Checkpoint


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group('GameState')
	spawn_player()
	$FanfareAudioStreamPlayer.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func player_died():
	$CrowdLaughter.play()
	$CrowdCheer.play()
	print('Player fell into pit!')
	$RestartTimer.start()	
	
func player_won():
	$CrowdBoo.play()
	print('Player won!')
	$RestartTimer.start()	


func _on_RestartTimer_timeout():
	player.queue_free()
	spawn_player()
	
func spawn_player():
	player = RIGID_PLAYER.instance()
	player.translation = current_checkpoint.translation
	add_child(player)


func _on_Goal_body_entered(body):
	print('Player won!')
	$RestartTimer.start()
	
