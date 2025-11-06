extends Node2D

@onready var fadeTrans : Sprite2D = $FadeTrans

func _on_room_trans_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		fadeTrans.visible = true
		Global.changeRoom("res://scenes/test.tscn")
		fadeTrans.visible = false
