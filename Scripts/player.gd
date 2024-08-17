extends RigidBody2D

var speed = 0
const acceleration = 40
const deacceleration = 10
var stopping_power = 0.9
const maxspeed = 300
var dashing = false
var X = 0
var Y = 0
var current_direction = Vector2(0,0)


func _physics_process(delta):
	
	print(speed)
	print(linear_velocity)
	
	if not dashing:
		linear_velocity.limit_length(2)
		if speed > maxspeed:
			speed = maxspeed
		pass
	
	
	if Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		speed += acceleration
		linear_velocity = Vector2(X,Y)*speed
	else:
		if speed > 0:
			speed -= deacceleration
		linear_velocity = linear_velocity*stopping_power
		if linear_velocity.length() < 0:
			linear_velocity = Vector2(0,0)
	
	if Input.is_action_pressed("move_up"):
		#linear_velocity += Vector2(0,-1)*speed
		Y = -1
		current_direction = linear_velocity
	elif Input.is_action_pressed("move_down"):
		#linear_velocity += Vector2(0,1)*speed
		Y = 1
		current_direction = linear_velocity
	else: Y = 0
	if Input.is_action_pressed("move_left"):
		#linear_velocity += Vector2(-1,0)*speed
		X = -1
		current_direction = linear_velocity
	elif Input.is_action_pressed("move_right"):
		#linear_velocity += Vector2(1,0)*speed
		X = 1
		current_direction = linear_velocity
	else: X = 0
	

