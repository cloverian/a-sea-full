extends Node

var isGameFullScreen : bool = false

func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _process(_delta) -> void:
	if Input.is_action_just_pressed("F4"):
		if not isGameFullScreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_size(Vector2i(640, 480))

func startDialogue(lines: Array[String]):
	# TODO add return if textbox exists
	var scene := preload("res://scenes/textbox.tscn").instantiate()
	scene.lines = lines
	get_parent().get_child(1).add_child(scene)
