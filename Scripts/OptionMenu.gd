extends Control


signal CloseOptionMenu

func _input(event):
	pass
func _ready():
	pass # Replace with function body.

func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)

func _on_Exit_pressed():
	emit_signal("CloseOptionMenu")
