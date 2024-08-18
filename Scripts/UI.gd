extends CanvasLayer



func _process(delta):
	if GlobalInfo.leveling_up:
		self.visible = true
	else:
		self.visible = false

