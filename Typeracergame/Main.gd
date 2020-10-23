extends Node2D

onready var score_text_panel = get_node("score")
var score = 0

onready var timer_panel = get_node("timer")
var timer = 3

onready var letter_panel = load("res://letter_panel.tscn")

var next_position = Vector2(512, 0)
var gap = Vector2(128, 0)

var letters = []

func _ready():
	for i in range(1, 100):
		var letter_panel_clone = letter_panel.instance()
		
		letter_panel_clone.set_position( next_position )
		next_position += gap
		
		letters.append(letter_panel_clone)
		
		get_node(".").call_deferred("add_child", letter_panel_clone)	
		
		
func set_score_text( score_value ):
	score_text_panel.text = "Score: " + str(score_value)
	
func _input(event):
	if event is InputEventKey and event.is_pressed():
		print( event.unicode )
		print( char( event.unicode )  )
		
		if char(event.unicode) == letters[0].letter.text:
			score += 1
			change_timer_value(0.25)
			print("done!")
		
			get_node(".").remove_child( letters[0] )
			letters.pop_front()
			
		
		set_score_text(score)

func change_timer_value(delta = -0.01):
	if( timer > 0 ):
		timer += delta
		timer_panel.scale.x = timer

func _process(delta):
	if( timer <= 0 ):
		get_tree().paused = true
		print("game over")
	change_timer_value()
	
