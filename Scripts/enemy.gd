extends RigidBody2D

var health = 30
var maxhealth = 30


func takedamage(damage):
	health -= damage
	print(health)

func _process(delta):
	if health <= 0:
		die()
		pass

func die():
	GlobalInfo.xp += maxhealth
	queue_free()
	pass
