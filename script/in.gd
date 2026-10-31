extends Area2D
var guy_nearby=false
var activated=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body) -> void:
	$Panel/Label.show()
	if body.name=="Firewall":
		guy_nearby=true
		
func _on_body_exited(body) -> void:
	if body.name=="Firewall":
		guy_nearby=false

func _process(_delta: float) -> void:
	if guy_nearby and not activated and Input.is_action_just_pressed("interact"):
		activated = true
		get_tree().change_scene_to_file("res://scene/trojan.tscn")
