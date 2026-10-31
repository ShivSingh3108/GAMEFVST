
extends CharacterBody2D

var speed =200.0
var direction = -1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var window_size = Vector2(200,200)
var health=10
@onready var animated_sprite = $horsy
@onready var hitbox = $hitbox2

var is_stun=false
var stun_timer=0.0
func maybe_stun():
		is_stun = true
		stun_timer = randf_range(2.0,3.0)
		speed = 0
		hitbox.monitoring=false
		$Label.show()
		animated_sprite.modulate=Color.DARK_GRAY
func _ready():
	animated_sprite.play("default")
	hitbox.body_entered.connect(_on_hitbox_2_body_entered)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_stun:
		stun_timer -= delta
		if stun_timer <= 0:
			is_stun = false
			speed = 200
			hitbox.monitoring=true
			$Label.hide()
			animated_sprite.modulate=Color.DARK_RED
			animated_sprite.flip_h=direction>0
			
			animated_sprite.play("default")
		return
	velocity=Vector2(direction*speed,0)
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider is TileMapLayer or collider is StaticBody2D:
			maybe_stun()
			direction *= -1
			break
			
			
func _on_hitbox_2_body_entered(body: Node2D) -> void:
	if body.name=="Firewall":
		print("hit") 
		body.take_damage(1)		
		

		
	
func take_damage(amount:int)-> void:
	if health <= 0:
		return
	health = max(health- amount,0)
	health= max(health,0)
	print("horse health:",health)
	var bar=get_tree().current_scene.get_node_or_null("horse/hpbar")
	if bar != null:
		bar.value=health	
	if health<=0:
		$win.show()
		print("horse defeat")
		speed=0
		hitbox.monitoring=false

			

		

	
	
			
		
		
