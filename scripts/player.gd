extends CharacterBody2D

const SPEED : float = 210.0
const JUMP_VELOCITY : float = -300.0
const GRAVITY : Vector2 = Vector2(0.0, 981.0)
var jumps : int = 0

func _input(_event) -> void:
	if Input.is_action_just_pressed("E"):
		Global.startDialogue([
			"* This is a textbox."
		])

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += GRAVITY * delta
		
	if is_on_floor(): jumps = 0
	if Input.is_action_just_pressed("Jump"):
		if jumps == 0:
			jumps = 1
			velocity.y = JUMP_VELOCITY
		elif jumps == 1:
			jumps = 2
			velocity.y = JUMP_VELOCITY * 1.2
	if Input.is_action_just_pressed("S"):
		velocity.y = -JUMP_VELOCITY * 7
			
	var direction := Input.get_axis("A", "D")
	if direction == -1: $Sprite.flip_h = true
	elif direction == 1: $Sprite.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
