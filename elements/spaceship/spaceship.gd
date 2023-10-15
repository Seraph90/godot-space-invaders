extends CharacterBody2D

@onready var timer = $ShotCooldownTimer
@onready var shotPlayer = $ShotPlayer
@onready var damagePlayer = $DamagePlayer

const ROCKET_PRELOAD = preload("res://elements/rocket/rocket.tscn")

const SPEED = 100.0

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		shot()
	
	var direction = Input.get_axis("ui_left", "ui_right")
	global_position.x += direction * SPEED * delta
	move_and_slide()

func shot():
	if !timer.is_stopped():
		return
		
	shotPlayer.play()
	var rocket = ROCKET_PRELOAD.instantiate()
	timer.start()
	rocket.global_position = global_position + Vector2(0, -11)
	add_child(rocket)

func takeDamage():
	damagePlayer.play()
	Globals.changeLives(-1)
