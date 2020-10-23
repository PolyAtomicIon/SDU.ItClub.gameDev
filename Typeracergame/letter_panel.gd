extends Node2D

onready var letter = get_node("letter")

var x = 0
var y = 300

var delta_x = 0.45

func _ready():
	randomize()
	
	#ASCII
	# 97 = a
	# c = 98
	# z = 97 + 25 
	
	var random_letter_value = rand_range(97, 97+26)
	letter.text = char( random_letter_value )

	x = get_position().x

func _process(delta):
	
	if( x < -48 ):
		get_tree().paused = true
		print("game over")
	
	x -= delta_x
	delta_x += 0.01
	set_position( Vector2( x , y ) )
