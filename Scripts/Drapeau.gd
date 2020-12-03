extends Node2D


func _ready():
	pass # Replace with function body.

func terminer():
	$AnimatedSprite.play("Finish")



func _on_Hitbox_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		get_tree().change_scene("res://Scenes/Game.tscn")
