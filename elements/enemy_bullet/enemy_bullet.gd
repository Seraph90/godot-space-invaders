extends CharacterBody2D

const SPEED = 50.0

func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * SPEED * delta)
	if !collision:
		return
	
	var collider = collision.get_collider()
	if collider.has_method("takeDamage"):
		collider.takeDamage()
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
