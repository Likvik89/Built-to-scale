extends Node2D

var parent_group

var swinging = false
var can_damage = true
var start_position
var ending_position
var damage
var start_rotation


func _ready():
	parent_group = get_parent().get_parent().get_groups()
	start_rotation = rotation
	
	

func _on_hitbox_body_entered(target):
	if swinging:
		if target.get_groups() != parent_group:
			if target.is_in_group("Player") or target.is_in_group("Enemies"):
				target.takedamage(damage)
	

func _process(delta):
	if not GlobalInfo.leveling_up:
		if get_parent().get_parent().is_in_group("Player"):
			if Input.is_action_pressed("sword_swing") and not swinging:
				var tween_rotation = create_tween()
				var tween_position = create_tween()
				tween_rotation.tween_property(self, "rotation", 0.4, 0.5)
				tween_position.tween_property(self, "position", ending_position, 0.5)
				swinging = true
			
		
		if swinging:
			$Sprite2D.visible = true
		else:
			$Sprite2D.visible = false
		if position == ending_position:
			position = start_position
			rotation = start_rotation
			swinging = false
	else:
		$Sprite2D.visible = false
	
	
