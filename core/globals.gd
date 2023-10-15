extends Node

var points := 0
var lives := 3

func changePoints(diff: int):
	points += diff
	Events.pointsChanged.emit(points)
	
func changeLives(diff: int):
	lives += diff
	Events.livesChanged.emit(lives)
