extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200
var motion = Vector2()
var bullet_speed = 2000
var bullet = preload("res://Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")	
	motion = move_and_slide(motion*speed)
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		fire()
func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		get_tree().reload_current_scene()
