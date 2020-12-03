extends Node2D
onready var timerCastle=get_node("TimerCastle")
var attackrate=1
var enemy=preload("res://Scenes/Ennemi1Bonhommeneige.tscn")
var hero=preload("res://Scenes/Player.tscn")
var map=preload("res://Scenes/Map.tscn")
var drapeau=preload("res://Scenes/Drapeau.tscn")
var allier=preload("res://Scenes/Allier.tscn")
var ennemy_is_not_in_zone=true
var Number_of_allie=4
var Win=false

func _ready():
	pass

func _process(delta):
	$Camera2D.position=get_global_mouse_position()	
	pass
	
func deadCastle():
	ennemy_is_not_in_zone=true
	$Player/GUI/GameOver.show()
	
	

	
func deadEnemyCastle():
	$Player/GUI/GameWin.show()
	Win=true
	
	
	
func _on_CastleBox_body_entered(body):
	ennemy_is_not_in_zone =false
	if(body.is_in_group("enemy")):
		while ennemy_is_not_in_zone ==false:
			yield(get_tree().create_timer(attackrate),"timeout")	
			$Player/GUI/CastleLifeBar.value-=10
			
			if($Player/GUI/CastleLifeBar.value)==0:
				deadCastle()		
				
			
				
func _on_TimerCastle_timeout():
	pass	

func _on_TimerRespawn_timeout():
	var yLoc=480
	var xLoc=5024
	var e=enemy.instance()
	add_child(e)
	e.position=Vector2(xLoc,yLoc)
	$TimerRespawn.wait_time=10
	$TimerRespawn.start()

func _on_EnemyCastleBox_area_entered(area):
	if(area.is_in_group("ammo")):
		$Player/GUI/EnemyCastleLife.value-=10
		
		if($Player/GUI/EnemyCastleLife.value)==0:
			deadEnemyCastle()	


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		if Number_of_allie>0:
			var yLoc=430
			var xLoc=220
			var a=allier.instance()
			add_child(a)
			a.position=Vector2(xLoc,yLoc)
			Number_of_allie-=1
			
		


func _on_Timer_Respawn_Allier_timeout():
	if(Number_of_allie<5):
		Number_of_allie+=1
	
