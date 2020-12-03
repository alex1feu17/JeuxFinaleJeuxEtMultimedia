extends KinematicBody2D
var life=30
const GRAVITY=10
const SPEED= 100
const FLOOR=Vector2(0,-1)
onready var timerdied=get_node("TimerDied")
onready var timerattack=get_node("TimerAttack")
var enemy=preload("res://Scenes/Ennemi1Bonhommeneige.tscn")
var velocity=Vector2()
var is_dead=false
var is_attacking=false
var attackrate=1
var ennemy_is_in_zone=false	

func _physics_process(delta):
	if is_dead==false&&is_attacking==false&&ennemy_is_in_zone==false:
		velocity.x=SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h=true
		velocity.y +=GRAVITY		
		velocity=move_and_slide(velocity,FLOOR)
func dead():
	$Area2D/CollisionShape2D.disabled
	$CollisionShape2D.disabled
	velocity=Vector2(0,0)
	$AnimatedSprite.play("Dead")
	timerdied.start()
	
	
func _ready():
	add_to_group("allie")
	life=30
	pass 

func _on_Area2D_area_entered(area):
			
	if(area.is_in_group("enemy")):	
		ennemy_is_in_zone=true		
		is_attacking=true
		while life > 0:
			$AnimatedSprite.play("Attack")
			yield(get_tree().create_timer(attackrate),"timeout")
			life-=10						
		if life==0:
			is_dead=true
			dead()	
		
		


func _on_Area2D_area_exited(area):
	ennemy_is_in_zone=false
	is_attacking=false


func _on_TimerDied_timeout():
	if is_dead==true:
		queue_free()
	pass
