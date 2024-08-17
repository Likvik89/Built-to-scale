extends Node2D

var parent_group

func _ready():
	parent_group = get_parent().get_groups()
	
	print(parent_group)
	pass

func _on_hitbox_body_entered(target):
	if (target.is_in_group("Player") or target.is_in_group("Enemies")) and target.get_groups() != parent_group:
		target.takedamage(20)
		
