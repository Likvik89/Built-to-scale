extends RigidBody2D

var health = 200
const maxhealth = 200

var speed = 0
const acceleration = 40
const deacceleration = 10
var stopping_power = 0.8
const maxspeed = 300
var dashing = false
var X = 0
var Y = 0


var dash_cooldown = 3
var time_between_dashes = 3
var dash_speed = 2000
var time_dashed = 0
var dash_duration = 0.25


func _process(delta):
	
	
	
	pass

func _physics_process(delta):
	
	
	if dashing:
		dash_cooldown = 0
		speed = dash_speed
		linear_velocity = linear_velocity.normalized()*speed
		
		time_dashed += delta
		
		if time_dashed >= dash_duration:
			dashing = false
			time_dashed = 0
	else:
		if dash_cooldown < time_between_dashes:
			dash_cooldown += delta
		if speed > maxspeed:
			speed = maxspeed
	
	
	if not dashing and (Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")):
		speed += acceleration
		linear_velocity = Vector2(X,Y)*speed
	else:
		if speed > 0:
			speed -= deacceleration
		linear_velocity = linear_velocity*stopping_power
		if linear_velocity.length() < 0:
			linear_velocity = Vector2(0,0)
	
	if Input.is_action_pressed("move_up"):
		if Y > -1:
			Y -= 0.2
	elif Input.is_action_pressed("move_down"):
		if Y < 1:
			Y += 0.2
	else: 
		if Y < 0:
			Y += 0.2
		if Y > 0:
			Y -= 0.2
	
	if Input.is_action_pressed("move_left"):
		if X > -1:
			X -= 0.2
	elif Input.is_action_pressed("move_right"):
		if X < 1:
			X += 0.2
	else: 
		if X < 0:
			X += 0.2
		if X > 0:
			X -= 0.2
	
	if Input.is_action_just_pressed("move_dash") and dash_cooldown >= time_between_dashes:
		dashing = true
	
	

func takedamage(damage):
	health -= damage
	print(health)
	pass
