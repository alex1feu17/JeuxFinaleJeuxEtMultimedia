extends KinematicBody2D

signal life_updated(life)
signal killed()

const SPEED=200
const GRAVITY=10
const JUMP_POWER=-500
const AMMO=preload("res://Scenes/Ammo.tscn")
var allie=preload("res://Scenes/Allier.tscn")
const FLOOR=Vector2(0,-1)
onready var timer=get_node("Timer")
var attackrate=1
var life=100
var flip_or_not=false
var ennemy_is_not_in_zone=true	
var is_dead= false
var on_ground=false
var velocity=Vector2()

var Verification_Accroupie =false

var Empty=false

func _ready():
	$GUI/life.value=life
	add_to_group("allie")

func Down():	
	
	if(Verification_Accroupie==false):
		if flip_or_not==true:
			$AnimatedSprite.play("Accroupie")
			$AnimatedSprite.flip_h=true
		else:					
			$AnimatedSprite.play("Accroupie")
			$AnimatedSprite.flip_h=false
		velocity=Vector2(0,0)
		Verification_Accroupie=true	
	
func Relever():
	
	if (Verification_Accroupie==true):
		timer.set_wait_time(0.5)
		timer.start()
		$AnimatedSprite.play("Relever")
		
func Idle():
	$AnimatedSprite.play("idle")

func Fire():
	if flip_or_not==false:
		if Empty==false:
			$Particles2D.emitting=true;
			$Particles2DInverse.emitting=false;
			$ParticuleTimer.start()
			
			$AnimatedSprite.play("Fire")
			var ammo=AMMO.instance()
			
			if sign($Position2D.position.x)==1:
				ammo.set_Ammo_direction(1)
				
				$Particles2D.emitting=true;
			else:
				ammo.set_Ammo_direction(-1)	
			get_parent().add_child(ammo)
			ammo.position=$Position2D.global_position 
		
			Empty=true
			
		else:
			Reload()
	else:
		if Empty==false:
			$Particles2DInverse.emitting=true;
			$Particles2D.emitting=false;
			$ParticuleTimer.start()
			
			$AnimatedSprite.play("Fire")
			var ammo=AMMO.instance()
			if sign($Position2DInverse.position.x)==1:
				ammo.set_Ammo_direction(1)
				$Particles2D.emitting=true;
				
			else:
				ammo.set_Ammo_direction(-1)	
			get_parent().add_child(ammo)
			ammo.position=$Position2DInverse.global_position 
		
			Empty=true
		else:
			Reload()		
		
	
func Reload():
	$AnimatedSprite.play("Reload")
	$TimerReload.start()
	$Particles2DInverse.emitting=false;
	$Particles2D.emitting=false;
	Empty=false		

	
		
	
		
func _on_Timer_timeout():
	
	if(Verification_Accroupie==true):
		Verification_Accroupie=false
		
func _physics_process(delta):
	
	if is_dead==false:	
		if Input.is_action_pressed("ui_right"):
			if Verification_Accroupie==false:
				velocity.x=SPEED
				$AnimatedSprite.play("Walk_Avant")
				$AnimatedSprite.flip_h=false
				flip_or_not=false
				if sign($Position2D.position.x)==-1:
					$Position2D.position.x *=-1

		elif Input.is_action_pressed("ui_left"):	
			if Verification_Accroupie==false:		
				velocity.x=-SPEED
				$AnimatedSprite.play("Walk_Avant")
				$AnimatedSprite.flip_h=true
				flip_or_not=true
				if sign($Position2D.position.x)==1:
					$Position2D.position.x *=1
		else:
			velocity.x=0
			if Verification_Accroupie==false:
				Idle()
				
		if Input.is_action_pressed("ui_home"):
			if on_ground==true&&Verification_Accroupie==false:
				velocity.y=JUMP_POWER
				on_ground=false
			
		velocity.y+=GRAVITY	
		
		if is_on_floor():
			on_ground=true
		else:
			on_ground=false
			
		velocity=move_and_slide(velocity,FLOOR)
		
		
		if Input.is_action_pressed("ui_down"):
			Down()
			
		if Input.is_action_pressed("ui_up"):
			Relever()
		
			
			
		if Input.is_action_just_pressed("ui_focus_next"):
			if(Verification_Accroupie==true):
				Fire()
		
		if get_slide_count()>0:
			for i in range(get_slide_count()):
				if "Ennemi1Bonhommeneige" in get_slide_collision(i).collider.name:
					dead()
		if($GUI/life.value==0):
			dead()
	
		
func dead():
	is_dead=true
	velocity=Vector2(0,0)
	$AnimatedSprite.play("Died")
	$CollisionShape2D.disabled=true
	$hitbox/CollisionShape2D.disabled=true
	$Timer.start()
	$TimerRespawn.start()	
	


func _on_hitbox_body_entered(body):
	if(body.is_in_group("enemy")):
		ennemy_is_not_in_zone =false
		while ennemy_is_not_in_zone ==false:
			yield(get_tree().create_timer(attackrate),"timeout")
			life=life-10
			$GUI/life.value=life
		
func _on_hitbox_body_exited(body):
	ennemy_is_not_in_zone=true
	
func _on_TimerRespawn_timeout():
	position.x=192
	position.y=448
	is_dead=false
	$GUI/life.value=100
	$AnimatedSprite.play("Idle")
	$CollisionShape2D.disabled=false
	$hitbox/CollisionShape2D.disabled=false
	




func _on_ParticuleTimer_timeout():
	$Particles2DInverse.emitting=false;
	$Particles2D.emitting=false;

