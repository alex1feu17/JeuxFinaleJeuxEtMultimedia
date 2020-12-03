extends Area2D

const SPEED=300
var velocity=Vector2()
var direction=1



func _ready():
	pass 

func set_Ammo_direction(dir):
	direction=dir
	if dir==-1:
		$AnimatedSprite.flip_h=true

func _physics_process(delta):
	velocity.x=SPEED*delta*direction
	translate(velocity)
	$AnimatedSprite.play("Shoot")



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Ammo_body_entered(body):	
	if(body.is_in_group("enemy")):	
		body.dead()
		$CollisionShape2D.disabled=true
		queue_free()

