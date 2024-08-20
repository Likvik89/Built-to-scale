extends CanvasLayer



func _process(delta):
	$Info/Time.text = str("Time passed: ", floor(GlobalInfo.time_passed), " seconds" )
	$Info/Level.text = str("Level ",GlobalInfo.level)
	$Info/Enemy_scaling.text = str("Enemy scaling: ",GlobalInfo.enemy_current_scaling)
	$Info/Health.text = str("Health: ", GlobalInfo.health,"/",GlobalInfo.maxhealth)
	$Info/Damage.text = str("Damage: ",GlobalInfo.damage)
	$Info/Damage_reduction.text = str("Damage reduction: ", (GlobalInfo.damage_reduction)*100,"%")
	$Info/Defence.text = str("Defence: ", GlobalInfo.defence)
	$Info/Regen.text = str("Regen per sec: ", GlobalInfo.regen)
	$Info/Scaling.text = str("Stat scaling: ", GlobalInfo.scaling)
	
	if GlobalInfo.dead:
		$Gameover.visible = true
	#else:
		#$Gameover.visible = false
	
	if GlobalInfo.paused:
		$Paused_text.visible = true
	else:
		$Paused_text.visible = false
	
	if GlobalInfo.leveling_up:
		$Level_up.visible = true
		$Level_up_text.visible = true
	else:
		$Level_up.visible = false
		$Level_up_text.visible = false



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
	GlobalInfo.scaling *= 1.2
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


func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	GlobalInfo.dead = false
	GlobalInfo.maxhealth = 200
	GlobalInfo.damage = 20
	GlobalInfo.damage_reduction = 0.9
	GlobalInfo.defence = 10
	GlobalInfo.regen = 1
	GlobalInfo.scaling = 1.1
	
	GlobalInfo.time_passed = 0
	GlobalInfo.xp = 0
	GlobalInfo.level = 1
	GlobalInfo.enemy_timer = 1
	GlobalInfo.enemy_current_scaling = 1
	GlobalInfo.enemy_scaling = 1.2
	GlobalInfo.xp_to_next_level = 30
	GlobalInfo.level_scaling = 2.1
	GlobalInfo.leveling_up = false
	GlobalInfo.paused = false

