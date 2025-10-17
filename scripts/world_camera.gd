extends Camera2D

@onready var player = get_parent().get_node("Player")

func _process(_delta) -> void:
	position = player.position
