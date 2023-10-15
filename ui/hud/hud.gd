extends CanvasLayer

@onready var PointsLabel = $MarginContainer/VBoxContainer/HBoxContainer/Score

func _ready():
	Events.pointsChanged.connect(updatePoints)

func updatePoints(points: int):
	PointsLabel.text = str(points)
