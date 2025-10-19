extends Node2D

var stage : int = 0

func _ready() -> void:
	$Background.visible = false
	$Text.visible = true
	$Text.modulate.a = 0
	
func _process(_delta: float) -> void:
	match stage:
		0: await gameBy()
		1: await 
		
func doInitialText() -> void:
	pass
