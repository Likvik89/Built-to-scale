extends CanvasLayer



func _process(delta):
	if GlobalInfo.leveling_up:
		$Level_up.visible = true
	else:
		$Level_up.visible = false



#Buttons doing button stuff
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


#Explanations
func _on_health_mouse_entered():
	$Explenations/Health_explanation.visible = true
func _on_health_mouse_exited():
	$Explenations/Health_explanation.visible = false

func _on_damage_mouse_entered():
	$Explenations/Damage_explanation.visible = true
func _on_damage_mouse_exited():
	$Explenations/Damage_explanation.visible = false

func _on_damage_reduction_mouse_entered():
	$Explenations/Damage_reduction_explanation.visible = true
func _on_damage_reduction_mouse_exited():
	$Explenations/Damage_reduction_explanation.visible = false

func _on_defence_mouse_entered():
	$Explenations/Defence_explanation.visible = true
func _on_defence_mouse_exited():
	$Explenations/Defence_explanation.visible = false

func _on_regen_mouse_entered():
	$Explenations/Regen_explanation.visible = true
func _on_regen_mouse_exited():
	$Explenations/Regen_explanation.visible = false

func _on_scaling_mouse_entered():
	$Explenations/Scaling_explanation.visible = true
func _on_scaling_mouse_exited():
	$Explenations/Scaling_explanation.visible = false
