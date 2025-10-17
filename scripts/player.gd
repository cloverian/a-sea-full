extends CharacterBody2D

const SPEED : float = 210.0
const JUMP_VELOCITY : float = -300.0
const GRAVITY : Vector2 = Vector2(0.0, 500.0)
var jumps : int = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += GRAVITY * delta
		
	if is_on_floor(): jumps = 0
	if Input.is_action_just_pressed("Jump"):
		match jumps:
			0:
				jumps = 1
				velocity.y = JUMP_VELOCITY
			1:
				jumps = 2
				velocity.y = JUMP_VELOCITY * 1.2
			
	var direction := Input.get_axis("A", "D")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
