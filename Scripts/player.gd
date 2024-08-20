extends RigidBody2D

var health = 200
var maxhealth = 200
var damage = 20
var damage_reduction = 0.9
var defence = 10
var regen = 1
var regen_timer = 1
var scaling = 1.1

var speed = 0
const acceleration = 40
const deacceleration = 10
var stopping_power = 0.8
const maxspeed = 200
var dashing = false
var X = 0
var Y = 0

var dash_cooldown = 3
var time_between_dashes = 3
var dash_speed = 1500
var time_dashed = 0
var dash_duration = 0.25

var invincible = false
var invinciblity_timer = 0


func _ready():
	$Sword_position/Sword.start_position = $Sword_position/Sword_start.position
	$Sword_position/Sword.position = $Sword_position/Sword_start.position
	$Sword_position/Sword.ending_position = $Sword_position/Sword_end.position
	$Sword_position/Sword.damage = damage

func _process(delta):
	GlobalInfo.health = health
	if health <= 0:
		GlobalInfo.dead = true
	
	if global_position.x > 1500:
		global_position.x = 1500
	if global_position.x < -1500:
		global_position.x = -1500
	
	if global_position.y > 1500:
		global_position.y = 1500
	if global_position.y < -1500:
		global_position.y = -1500
	
	
	if not GlobalInfo.leveling_up and not GlobalInfo.paused and not GlobalInfo.dead:
#		print(invincible)
		if invincible and not dashing:
			
			invinciblity_timer += delta
			if invinciblity_timer >= 1:
				invincible = false
				invinciblity_timer = 0
		
		regen_timer += delta
		if health < maxhealth and regen_timer >= 1:
			health += regen
			regen_timer = 0
	maxhealth = GlobalInfo.maxhealth
	damage = GlobalInfo.damage
	damage_reduction = GlobalInfo.damage_reduction
	defence = GlobalInfo.defence
	regen = GlobalInfo.regen
	scaling = GlobalInfo.scaling


func _physics_process(delta):
	if invincible:
		get_node("CollisionShape2D").disabled = true
	else:
		get_node("CollisionShape2D").disabled = false
	
	if not GlobalInfo.leveling_up and not GlobalInfo.paused and not GlobalInfo.dead:
		
		if dashing:
			invincible = true
			dash_cooldown = 0
			speed = dash_speed
			linear_velocity = linear_velocity.normalized()*speed
			
			time_dashed += delta
			
			if time_dashed >= dash_duration:
				dashing = false
				time_dashed = 0
				invincible = false
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
	else:
		linear_velocity = Vector2(0,0)

func takedamage(damage):
	if not invincible:
		if damage*damage_reduction-defence > 1:
			health -= damage*(1-damage_reduction)-defence
		else:
			health -= 1
		invincible = true
