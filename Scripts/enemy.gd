extends RigidBody2D

var health = 30
const maxhealth = 30

func takedamage(damage):
	health -= damage
	print(health)
