extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var motion = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	var player = get_parent().get_node("Player")
	if position.x < player.position.x:
		motion.x = 1
	if position.x > player.position.x:
		motion.x = -1
	if position.y < player.position.y:
		motion.y = 1
	if position.y > player.position.y:
		motion.y = -1
	move_and_slide(motion*30)
	look_at(player.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()


func _on_Area2D_area_entered(area):
	pass
