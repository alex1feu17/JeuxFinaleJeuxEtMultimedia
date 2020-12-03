extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var battle_music=load("res://Music/MusicSam.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func play_music():
	$Music.stream=battle_music
	$Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
