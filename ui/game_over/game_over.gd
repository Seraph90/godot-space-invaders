extends CanvasLayer

@onready var label = $MarginContainer/VBoxContainer/Label
@onready var winPlayer = $WinPlayer
@onready var losePlayer = $LosePlayer

const WIN_TEXT = "YOU WIN"
const LOSE_TEXT = "YOU DIED"  

var text = LOSE_TEXT
var color = Pallete.RED

func _ready():
	Globals.lives = 3
	Globals.points = 0
	if text == LOSE_TEXT:
		losePlayer.play()
	else:
		winPlayer.play()
	label.text = text
	label.set("theme_override_colors/font_color", color)

func _on_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func win():
	text = WIN_TEXT
	color = Pallete.GREEN

func lose():
	text = LOSE_TEXT
	color = Pallete.RED
