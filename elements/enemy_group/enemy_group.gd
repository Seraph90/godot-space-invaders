extends Node2D

const ENEMY_PRELOAD = preload("res://elements/enemy/enemy.tscn")

const ROWS = 4
const COLS = 8

const ROW_STEP = 2
const ROW_SPEED_ICREMENT = 2

@onready var blockTimer = $BlockTimer
@onready var shotTimer = $ShotTimer

var direcion := Vector2.RIGHT
var speed := 20

func spawn():
	for y in ROWS:
		for x in COLS:
			var enemy = ENEMY_PRELOAD.instantiate()
			enemy.global_position.x = global_position.x + 28 + x * 20
			enemy.global_position.y = global_position.y + 20 + y * 16
			add_child(enemy)

func changeDirection():
	if !blockTimer.is_stopped():
		return
	direcion = -direcion
	global_position.y += ROW_STEP
	speed += ROW_SPEED_ICREMENT
	blockTimer.start()

func _process(delta):
	global_position += direcion * speed * delta  

func _on_shot_timer_timeout():
	shotTimer.wait_time = randf_range(0.2, 0.8)
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() <= 0:
		return
	enemies.pick_random().shot()
