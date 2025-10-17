extends CharacterBody2D

const SPEED : float = 210.0
const JUMP_VELOCITY : float = -220.0
const GRAVITY : Vector2 = Vector2(1.0, 300.0)
var hasDoubleJumped : bool = false

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity += GRAVITY * delta

    if Input.is_action_just_pressed("Jump"):
        if is_on_floor(): 
            velocity.y = JUMP_VELOCITY
            hasDoubleJumped = false
        elif not is_on_floor() and not hasDoubleJumped:
            velocity.y = JUMP_VELOCITY * 1.2
            hasDoubleJumped = true
            

    var direction := Input.get_axis("A", "D")
    if direction:
        velocity.x = direction * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

    move_and_slide()
