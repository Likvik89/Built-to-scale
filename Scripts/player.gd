extends RigidBody2D

var health = 200
var maxhealth = 200
var damage_reduction = 0.9
var defence = 10

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

const base_damage = 20

func _ready():
	$Sword_position/Sword.start_position = $Sword_position/Sword_start.position
	$Sword_position/Sword.position = $Sword_position/Sword_start.position
	$Sword_position/Sword.ending_position = $Sword_position/Sword_end.position
	$Sword_position/Sword.damage = base_damage

func _physics_process(delta):
	
	
	#print("X = ",X)
	#print("Y = ",Y)
	
	
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
	if Input.is_action_pressed("move_down"):
		if Y < 1:
			Y += 0.2
	if not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"): 
		if Y < 0:
			if Y > -0.25:
				Y = 0
			else: 
				Y += 0.2
		if Y > 0:
			Y -= 0.2
	
	if Input.is_action_pressed("move_left"):
		if X > -1:
			X -= 0.2
	if Input.is_action_pressed("move_right"):
		if X < 1:
			X += 0.2
	if not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"): 
		if X < 0 :
			if X > -0.25:
				X = 0
			else:
				X += 0.2
		if X > 0:
			X -= 0.2
	
	if Input.is_action_just_pressed("move_dash") and dash_cooldown >= time_between_dashes:
		dashing = true
	
	

func takedamage(damage):
	health -= damage*damage_reduction-defence
	
