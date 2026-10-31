
extends CharacterBody2D

var speed =100.0
var direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var window_size = Vector2(200,200)
@onready var animated_sprite = $spear
@onready var hitbox = $hitbox3


func _ready():
	animated_sprite.play("Walk2")
	hitbox.body_entered.connect(_on_hitbox_3_body_entered)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
		velocity=Vector2(direction*speed,0)
		move_and_slide()
		if is_on_wall():
			direction *=-1
			animated_sprite.flip_h=direction<0

func _on_hitbox_3_body_entered(body: Node2D) -> void:
	if body.name=="Firewall":
		print("hit") 
		body.take_damage(3)		
	
	
	

			

		

	
	
			
		
		
