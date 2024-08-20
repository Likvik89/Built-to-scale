extends Node

var time_passed = 0
var xp = 0
var level = 1
var enemy_timer = 1
var enemy_current_scaling = 1
var enemy_scaling = 1.1
var xp_to_next_level = 30
var level_scaling = 2.1
var leveling_up = false
var paused = false

#player variables

var health = 200
var maxhealth = 200
var damage = 20
var damage_reduction = 0.1
var defence = 10
var regen = 1
var scaling = 1.2
var dead = false


func _ready():
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

func _process(delta):
	if not dead:
		if not leveling_up:
			if Input.is_action_just_pressed("Pause"):
				if not paused:
					paused = true
				else:
					paused = false
			time_passed += delta
			if time_passed/35 >= enemy_timer:
				enemy_timer += 1
				enemy_current_scaling *= 1.1
		
		if xp >= xp_to_next_level:
			level_up()

func level_up():
	level += 1
	xp_to_next_level *= level_scaling
	leveling_up = true
