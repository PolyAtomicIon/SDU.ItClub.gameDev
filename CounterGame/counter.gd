extends Node2D

onready var score_text = get_node("Score/score_text")
onready var time = get_node("time")
var score = 0
var cur_scale = 5

func _ready():
	print("game started")

func change_scale(x = -0.01):
	
	if( cur_scale < 0 ):
		get_tree().paused = true
		return
	
	cur_scale += x
	cur_scale = min(5, cur_scale)
	time.scale.x = cur_scale

func _process(delta):
	change_scale()
	
func increment():
	score += 1
	score_text.text = str(score)
