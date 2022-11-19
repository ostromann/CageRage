extends Control


func _on_StartGameButton_pressed():
	get_tree().change_scene("res://GLOBAL.tscn")


func _on_ExitGameButton_pressed():
	get_tree().quit()
