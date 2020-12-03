extends Node2D

func _ready():
	pass 

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/SecondaryScreen.tscn")
	pass 


func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/Options.tscn")
	pass 
