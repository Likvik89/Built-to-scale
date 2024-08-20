extends Node2D

func _process(delta):
	if GlobalInfo.leveling_up or GlobalInfo.paused:
		$CanvasModulate.visible = true
	else:
		$CanvasModulate.visible = false
