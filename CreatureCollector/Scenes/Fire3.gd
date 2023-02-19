extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(PoolVector2Array) var RoamPositions

export(float) var WaitTime = 3.2
var timer = 0

var index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export(float) var MoveSpeed = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer > 0:
		timer -= delta
	else:
		var target = RoamPositions[index]
		var p = position
		
		if abs(target.x - p.x) <= 0.001 and abs(target.y - p.y) <= 0.001:
			index += 1
			index %= RoamPositions.size()
			timer = WaitTime
		
		var moveX = 1.0 if target.x > p.x else (-1.0 if target.x < p.x else 0.0)
		var moveY = 1.0 if target.y > p.y else (-1.0 if target.y < p.y else 0.0)

		position.x += moveX * MoveSpeed
		position.y += moveY * MoveSpeed
