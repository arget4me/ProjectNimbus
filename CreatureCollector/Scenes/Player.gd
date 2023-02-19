extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export(float) var MoveSpeed = 3.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var moveX = 1.0 if Input.is_action_pressed("ui_right") else (-1.0 if Input.is_action_pressed("ui_left") else 0.0)
	var moveY = 1.0 if Input.is_action_pressed("ui_down") else (-1.0 if Input.is_action_pressed("ui_up") else 0.0)

	position.x += moveX * MoveSpeed
	position.y += moveY * MoveSpeed
	
	


func _on_Area2D_area_entered(area):
	get_tree().load("res://Scenes/BattleScene.tscn")
