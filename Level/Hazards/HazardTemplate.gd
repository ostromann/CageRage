extends Area

func _on_Hazard_body_entered(body):
	get_tree().call_group("GameState", "player_died")
