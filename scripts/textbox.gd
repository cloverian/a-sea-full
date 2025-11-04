extends Panel

@onready var label = $Text
@export var lines : Array[String]
var queueIndex : int = 0
var isPrinting : bool = false

func _ready() -> void:
	startPrinting(lines[queueIndex])

func _input(_event) -> void:
	if not isPrinting:
		if Input.is_action_just_pressed("Confirm"):
			if queueIndex == len(lines) - 1: queue_free()
			else:
				queueIndex += 1
				startPrinting(lines[queueIndex])
	else:
		if Input.is_action_just_pressed("Back"):
			isPrinting = false
			label.visible_characters = -1
	
func startPrinting(toPrint: String) -> void:
	isPrinting = true
	var i : int = 0
	#var buffer : String = ""
	while i < len(toPrint):
		label.visible_characters += 1
		await Global.wait(0.03)
	isPrinting = false
