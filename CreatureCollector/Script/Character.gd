extends KinematicBody2D

var velocity = Vector2.ZERO


func _physics_process(_delta):
	velocity.y += 5
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = 100
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -100
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -200
		
	velocity = move_and_slide(velocity)
