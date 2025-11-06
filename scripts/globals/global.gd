extends Node

var isGameFullScreen : bool = false
var textSpeed : int = 30

func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_size(Vector2i(640, 480))

func _process(_delta) -> void:
	if Input.is_action_just_pressed("F4"):
		if not isGameFullScreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			isGameFullScreen = true
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_size(Vector2i(640, 480))
			isGameFullScreen = false
	if Input.is_action_just_pressed("ESC"):
		get_tree().quit(0)
		
func changeRoom(scene: String) -> void:
	var trans := get_parent().get_node("Test/FadeTrans")
	trans.modulate.a = 0
	tween(trans, "modulate", Color(1, 1, 1, 1), 0.2)
	await wait(0.2)
	get_tree().change_scene_to_file(scene)
	tween(trans, "modulate", Color(1, 1, 1, 0), 0.2)
	await wait(0.2)

func hasPlayedGameBefore() -> bool:
	return FileAccess.file_exists("user://save.sav")

func startDialogue(lines: Array[String]):
	if get_parent().get_node("WorldCamera"): return
	var scene := preload("res://scenes/textbox.tscn").instantiate()
	scene.lines = lines
	get_parent().add_child(scene)
	scene.position = get_parent().get_node("Player").position

func wait(amount: float) -> void:
	await get_tree().create_timer(amount).timeout
	
func tween(object: Object, property: NodePath, final_val, duration: float, transition: Tween.TransitionType = Tween.TRANS_LINEAR) -> void:
	if transition == Tween.TRANS_LINEAR:
		get_tree().create_tween().tween_property(object, property, final_val, duration)
	else:
		get_tree().create_tween().tween_property(object, property, final_val, duration).set_trans(transition)

func isNegative(number: float) -> bool:
	if number == 0: return false
	if abs(number) / number == 1: return false
	else: return true
