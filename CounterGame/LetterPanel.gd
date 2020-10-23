extends Node2D

var x = 0
var y = 0
var delta_x = 0.25

# Called when the node enters the scene tree for the first time.
func _ready():
	x = get_position().x
	y = get_position().y
	
func _process(delta):
	x -= delta_x
	
	if x < -564:
		print('stop it')
		get_tree().paused = true
	
	delta_x += 0.005
	set_position( Vector2(x, y) )
