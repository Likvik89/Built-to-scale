extends Node2D


@export var enemy : PackedScene
@onready var player = $Player

var cooldown = 0
var spawnspeed = 6

func spawn():
	
	if player != null:
		var spawn = enemy.instantiate()
		var spawndistance = randi_range(700.0,900.0)
		var spawnangle = randi_range(0.0,360.0)
		var direction = Vector2(cos(spawnangle), sin(spawnangle))
		var spawnposition = player.position + Vector2(direction*spawndistance)
		
		
		spawn.position = spawnposition
		spawn.player = player
		add_child(spawn)

func _process(delta):
	
	if cooldown <= 0:
		spawn()
		cooldown = spawnspeed + randi_range(0,2)
	else:
		cooldown -= delta
