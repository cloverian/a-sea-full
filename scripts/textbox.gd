extends Panel

@onready var lines : Array[String]
var queueIndex : int = 0
var textSpeed : int = 30

func _ready() -> void:
	pass
	#startPrinting(lines[queueIndex])

func _input(_event) -> void:
	pass
	
func startPrinting(toPrint: String) -> void:
	pass
