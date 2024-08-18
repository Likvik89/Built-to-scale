extends RigidBody2D

var health = 30
var maxhealth = 30
var player 
var speed = 200



func _ready():
	health *= GlobalInfo.enemy_current_scaling
	maxhealth *= GlobalInfo.enemy_current_scaling

func _process(delta):
	if health <= 0:
		die()
		pass

func _physics_process(delta):
	if not GlobalInfo.leveling_up:
		
		if player != null:
			var player_direction = (player.position - position).normalized()
			linear_velocity = Vector2(player_direction)*speed
	else:
		linear_velocity = Vector2(0,0)

func takedamage(damage):
	health -= damage

func die():
	GlobalInfo.xp += maxhealth
	queue_free()
