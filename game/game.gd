extends Node2D

const GAME_OVER_PRELOAD = preload("res://ui/game_over/game_over.tscn")

@onready var EnemyGroup = $EnemyGroup

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.livesChanged.connect(func(_lives): checkGameOver())
	Events.enemiesDied.connect(checkGameOver)
	EnemyGroup.spawn()

func gameOver(success: bool):
	get_tree().paused = true
	var gameOverScene = GAME_OVER_PRELOAD.instantiate()
	if success:
		gameOverScene.win()
	else:
		gameOverScene.lose()
	add_child(gameOverScene)

func checkGameOver():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if Globals.lives <= 0:
		gameOver(false)
	elif enemies.size() <= 1:
		gameOver(true)
