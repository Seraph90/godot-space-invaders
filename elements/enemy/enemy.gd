extends CharacterBody2D

const BULLET_PRELOAD = preload("res://elements/enemy_bullet/enemy_bullet.tscn")

@onready var RaycastLeft = $RayCastLeft
@onready var RaycastRight = $RayCastRight
@onready var Collision = $CollisionShape2D
@onready var diePlayer = $DiePlayer
@onready var shotPlayer = $ShotPlayer

func _physics_process(_delta):
	if RaycastLeft.is_colliding() or RaycastRight.is_colliding():
		get_tree().call_group("enemy_group", "changeDirection")

func destroy():
	Globals.changePoints(1)
	Events.enemiesDied.emit()
	Collision.disabled = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.3)
	diePlayer.play()
	tween.tween_callback(queue_free)

func shot():
	shotPlayer.play()
	var bullet = BULLET_PRELOAD.instantiate()
	bullet.global_position = global_position + Vector2(0, +10)
	get_parent().add_child(bullet)
