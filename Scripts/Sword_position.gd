extends Marker2D

var last_rotation
var swinging = false
var swinging_time


func _physics_process(delta):
	
	
	if not swinging:
		last_rotation = rotation
		look_at(get_global_mouse_position())
	if swinging:
		swinging_time += delta
		if swinging_time >= 1:
			swinging = false
		pass
	
	if Input.is_action_just_pressed("sword_swing"):
		rotation = last_rotation
		swinging = true
		swinging = 0

