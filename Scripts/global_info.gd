extends Node

var time_passed = 0
var xp = 0
var level = 1
var enemy_timer = 1
var enemy_current_scaling = 1
var enemy_scaling = 1.2
var xp_to_next_level = 30
var level_scaling = 2.1
var leveling_up = false


#player variables

var health = 200
var maxhealth = 200
var damage = 20
var damage_reduction = 0.9
var defence = 10
var regen = 1
var scaling = 1.1



func _process(delta):
	time_passed += delta
	if time_passed/10 >= enemy_timer:
		enemy_timer += 1
		enemy_current_scaling *= enemy_scaling
	
	if xp >= xp_to_next_level:
		level_up()

func level_up():
	level += 1
	xp_to_next_level *= level_scaling
	leveling_up = true
