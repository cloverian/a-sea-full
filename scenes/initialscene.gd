extends Node2D

var stage : int = -1

func _ready() -> void:
	$Background.visible = false
	$AGameBy.visible = true
	$AGameBy.modulate.a = 0
	
	if Global.hasPlayedGameBefore():
		gameByToLearnEnglish()
		get_tree().change_scene_to_file("res://scenes/test.tscn")
	else: stage = 0
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("E"):
		get_tree().change_scene_to_file("res://scenes/test.tscn")
	match stage:
		0: gameByToLearnEnglish()
		1: get_tree().change_scene_to_file("res://scenes/test.tscn")
		
func gameByToLearnEnglish() -> void:
	await Global.wait(1.0)
	if not Global.hasPlayedGameBefore():
		$AGameBy.text = "Un gioco da[color=yellow] Clover[/color] e[color=yellow] Figs[/color]"
	else:
		$AGameBy.text = "A game by[color=yellow] Clover[/color] and[color=yellow] Figs[/color]"
	Global.tween($AGameBy, "modulate", Color(1, 1, 1, 1), 1.5)	
	await Global.wait(2.0)
	Global.tween($AGameBy, "modulate", Color(1, 1, 1, 0), 1.5)
	stage += 1
