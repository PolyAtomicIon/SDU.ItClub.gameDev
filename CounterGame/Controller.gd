extends Node2D

onready var score_text = get_node("Score/score_text")
onready var letter_panel = load("res://LetterPanel.tscn")

onready var root_node = get_node("/root/Controller")

onready var ui_controller = get_node("Background and UI/UI/Main")

var letters = []

var score = 0

var next_position = Vector2(0, 32)
var gap = Vector2(96, 0)

func _ready():
	spawn_objects()

func spawn_objects():
	for i in range(250):
		var letter_panel_clone = letter_panel.instance()
		
		letter_panel_clone.position = next_position
		next_position += gap
		
		randomize()
		letter_panel_clone.get_child(1).text = char(rand_range(97, 97+26))
		
		letters.append(letter_panel_clone)
		
		root_node.call_deferred("add_child", letter_panel_clone)	

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if char(event.unicode) == letters[0].get_child(1).text:
			root_node.remove_child( letters[0] )
			letters.pop_front()
			
			ui_controller.increment()
			ui_controller.change_scale(0.5)
