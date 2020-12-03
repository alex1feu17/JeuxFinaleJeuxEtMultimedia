extends Node2D


func _ready():

	pass 


func _on_Formation_pressed():
	get_tree().change_scene("res://Scenes/Formation.tscn")


func _on_Selection_niveaux_pressed():
	get_tree().change_scene("res://Scenes/Map.tscn")


func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/Options.tscn")


func _on_Exit_pressed():
	get_tree().change_scene("res://Scenes/MainTitleScreen.tscn")
