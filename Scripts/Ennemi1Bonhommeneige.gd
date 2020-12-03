extends KinematicBody2D

var life=50
const GRAVITY=10
const SPEED= -80
const FLOOR=Vector2(0,-1)
onready var timerdied=get_node("TimerDied")
var lifecastle=100
var allielife=100
var attackrate=1
var allie_is_not_in_zone=true	
var velocity=Vector2()
var is_dead=false
var is_attacking=false
export var attackDist=30

func _ready():
	add_to_group("enemy")
	
	 

func dead():
	is_dead=true
	$CollisionShape2D.disabled=true
	$hitbox/CollisionShape2D.disabled=true	
	velocity=Vector2(0,0)
	$AnimatedSprite.play("Dead")
	timerdied.start()
	

func _physics_process(delta):
	if is_dead==false&&is_attacking==false&&allie_is_not_in_zone==true:
		velocity.x=SPEED
		$AnimatedSprite.play("Walk")
		velocity.y +=GRAVITY
		
		velocity=move_and_slide(velocity,FLOOR)

	
func _on_TimerDied_timeout():
	if is_dead==true:
		queue_free()
	pass

func _on_hitbox_area_entered(area):
		
	allie_is_not_in_zone=false
	if area !=null:	
		if(area.is_in_group("castle")):	
			is_attacking=true		
			while lifecastle !=0:
				yield(get_tree().create_timer(attackrate),"timeout")
				$AnimatedSprite.play("Attack")
				lifecastle-=10	
				
		if(area.is_in_group("allie")):		
			is_attacking=true
			while allie_is_not_in_zone ==false:	
				yield(get_tree().create_timer(attackrate),"timeout")
				$AnimatedSprite.play("Attack")
				allielife-=5
				life-=5
			if life==0:
				is_dead=true
				dead()
			
							
func deadCastle():
	get_tree().change_scene("res://Scenes/SecondaryScreen.tscn")
	
func _on_TimerAttack_timeout():
	if is_attacking==true:
		is_attacking=false
	pass


func _on_hitbox_area_exited(area):
	allie_is_not_in_zone=true
	is_attacking=false




