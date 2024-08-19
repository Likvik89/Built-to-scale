extends CanvasLayer



func _process(delta):
	$Info/Time.text = str("Time passed: ", GlobalInfo.time_passed)
	$Info/Level.text = str("Level",GlobalInfo.level)
	$Info/Enemy_scaling.text = str("Enemy scaling: ",GlobalInfo.enemy_current_scaling)
	$Info/Health.text = str(" health: ", GlobalInfo.health,"/",GlobalInfo.maxhealth)
	$Info/Damage.text = str("Damage: ",GlobalInfo.damage)
	$Info/Damage_reduction.text = str("Damage reduction: ", (1-GlobalInfo.damage_reduction)*100,"%")
	$Info/Defence.text = str("Defence: ", GlobalInfo.defence)
	$Info/Regen.text = str("Regen per sec: ", GlobalInfo.regen)
	$Info/Scaling.text = str("Stat scaling: ", GlobalInfo.scaling)
	
	
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
