extends Area


func _on_Goal_body_entered(body):
		get_tree().call_group("GameState", "player_won")
