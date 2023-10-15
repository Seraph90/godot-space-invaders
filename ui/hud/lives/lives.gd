extends HBoxContainer

const LIVE_PRELOAD = preload("res://ui/hud/lives/live_rect.tscn")

func _ready():
	Events.livesChanged.connect(updateLives)
	updateLives(Globals.lives)

func updateLives(lives: int):
	if lives < 0:
		return
	
	var diff = lives - get_child_count()

	for i in range(abs(diff)):
		addLive() if diff > 0 else removeLive()

func addLive():
	add_child(LIVE_PRELOAD.instantiate())

func removeLive():
	if get_child_count() > 0:
		get_child(0).queue_free()
