extends Control


func _ready():
	pass 


func _on_Exit_pressed():
	get_tree().change_scene("res://Scenes/Map.tscn")


func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
