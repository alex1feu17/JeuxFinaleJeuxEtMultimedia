extends CanvasLayer

func _input(event):
	if event.is_action_pressed("GameMenu"):
		get_node("GameMenu").show()
		
	
		


func _ready():	
	pass
	

func _on_Option_pressed():
	
	var options_menu =load("res://Scenes/OptionMenu.tscn").instance()
	add_child(options_menu)
	get_node("OptionMenu").connect("CloseOptionMenu",self,"CloseOptionMenu")

func CloseOptionMenu():
	
	get_node("OptionMenu").queue_free()


func _on_Exit_pressed():
	
	get_node("GameMenu").hide()


func _on_Restart_pressed():
	
	get_tree().change_scene("res://Scenes/Game.tscn")


func _on_Surrender_pressed():
	
	get_tree().change_scene("res://Scenes/Map.tscn")



	

