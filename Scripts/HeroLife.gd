extends TextureProgress



func _ready():
	pass

func _physics_process(delta):
	value=get_tree().root.get_node("Game").get_node("Player").life
	pass
