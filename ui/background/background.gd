extends ParallaxBackground

const SPEED = 25

func _process(delta):
	scroll_offset.y += SPEED * delta
