extends Node

var time_passed = 0
var xp = 0
var level = 1
#var scaling = 1
var xp_to_next_level = 30
var level_scaling = 2.1

func _process(delta):
	time_passed += delta
	
	if xp >= xp_to_next_level:
		level_up()

func level_up():
	level += 1
	xp_to_next_level *= level_scaling
	print(level)
	print(xp)
	print(xp_to_next_level)
