extends RigidBody2D

var speed = 0
const acceleration = 20
const deacceleration = 2
var stopping_power = 0.9
const maxspeed = 200
var dashing = false


func _physics_process(delta):
	
	print(speed)
	
	if not dashing:
		if speed > maxspeed:
			speed = maxspeed
		pass
	
	if Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		speed += acceleration
	else:
		if speed > 0:
			speed -= deacceleration
		linear_velocity = linear_velocity*stopping_power
	
	if Input.is_action_pressed("move_up"):
		linear_velocity = Vector2(0,-1)*speed
	if Input.is_action_pressed("move_down"):
		print("down")
	if Input.is_action_pressed("move_left"):
		print("left")
	if Input.is_action_pressed("move_right"):
		print("right")
	

