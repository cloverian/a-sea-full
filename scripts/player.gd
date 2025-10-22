extends CharacterBody2D

const MAXSPEED : float = 250.0
const ACCELERATION : float = 35.0
const JUMP_VELOCITY : float = -400.0
const GRAVITY : Vector2 = Vector2(0.0, 900.0)
var turn : bool = false # R -> left, F -> right
var jumps : int = 0
var direction : float = 0.0

func _ready() -> void:
	pass

func _process(_delta) -> void:
	if Input.is_action_just_pressed("E"):
		position = Vector2(341, 258)
		velocity.x = 0
		velocity.y = 0
	$Label.text = "(" + str(velocity.x) + ", " + str(roundi(velocity.y)) + ")\n" + str(direction)

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
		velocity.y = -JUMP_VELOCITY * 4
			
	direction = Input.get_axis("A", "D")
	if direction:
		$Sprite.flip_h = not Global.isNegative(direction)
	
	if direction:
		$Sprite.play("idle")
		velocity.x += (direction * ACCELERATION) if abs(velocity.x) < MAXSPEED else 0.0
	else:
		$Sprite.frame = 0
		$Sprite.stop()
		velocity.x = move_toward(velocity.x, 0, ACCELERATION)

	move_and_slide()
