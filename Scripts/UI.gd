extends CanvasLayer



func _process(delta):
	if GlobalInfo.leveling_up:
		$Level_up.visible = true
	else:
		$Level_up.visible = false




func _on_health_pressed():
	GlobalInfo.maxhealth *= GlobalInfo.scaling
	GlobalInfo.leveling_up = false


func _on_damage_pressed():
	GlobalInfo.damage *= GlobalInfo.scaling
	GlobalInfo.leveling_up = false


func _on_damage_reduction_pressed():
	GlobalInfo.damage_reduction *= GlobalInfo.scaling
	GlobalInfo.leveling_up = false


func _on_defence_pressed():
	GlobalInfo.defence *= GlobalInfo.scaling
	GlobalInfo.leveling_up = false


func _on_regen_pressed():
	GlobalInfo.regen *= GlobalInfo.scaling
	GlobalInfo.leveling_up = false


func _on_scaling_pressed():
	GlobalInfo.scaling *= GlobalInfo.scaling
	GlobalInfo.leveling_up = false

