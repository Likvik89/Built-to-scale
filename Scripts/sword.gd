extends Node2D

var parent_group

var swinging = false
var can_damage = true
var start_position
var ending_position
var damage

func _ready():
	parent_group = get_parent().get_groups()
	
	
	

func _on_hitbox_body_entered(target):
	if target.get_groups() != parent_group:
		if target.is_in_group("Player") or target.is_in_group("Enemies"):
			target.takedamage(damage)
		pass
	#if (target.is_in_group("Player") or target.is_in_group("Enemies")) and target.get_groups() != parent_group:
	#	target.takedamage(20)
	pass

func _process(delta):
	if get_parent().is_in_group("Player"):
		if Input.is_action_just_pressed("sword_swing"):
			var tween = create_tween()
			
			tween.tween_property(self, "rotation", 2, 0.5)
			
			
			pass
		pass
	pass
