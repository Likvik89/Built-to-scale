extends Node2D

func _process(delta):
	if GlobalInfo.leveling_up:
		$CanvasModulate.visible = true
	else:
		$CanvasModulate.visible = false
