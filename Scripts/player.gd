extends RigidBody2D

var speed = 0
const acceleration = 60
const deacceleration = 2
var stopping_power = 0.9
const maxspeed = 200
var dashing = false
var X = 0
var Y = 0

func _physics_process(delta):
	
	if not dashing:
		linear_velocity.limit_length(2)
		if speed > maxspeed:
			speed = maxspeed
		pass
	
	
	
	
	
	if Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		speed += acceleration
	else:
		if speed > 0:
			speed -= deacceleration
		linear_velocity = linear_velocity*stopping_power
		if linear_velocity.length() < 0:
			linear_velocity = Vector2(0,0)
		
	
	if Input.is_action_pressed("move_up"):
		#linear_velocity += Vector2(0,-1)*speed
		Y = -1
	elif Input.is_action_pressed("move_down"):
		#linear_velocity += Vector2(0,1)*speed
		Y = 1
	else: Y = 0
	if Input.is_action_pressed("move_left"):
		#linear_velocity += Vector2(-1,0)*speed
		X = -1
	elif Input.is_action_pressed("move_right"):
		#linear_velocity += Vector2(1,0)*speed
		X = 1
	else: X = 0
	
	linear_velocity = Vector2(X,Y)*speed

