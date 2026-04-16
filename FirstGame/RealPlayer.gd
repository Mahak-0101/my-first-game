extends KinematicBody

var speed = 5
var jump_speed = 6
var velocity = Vector3()
var gravity = 9.8
var score = 0

func _physics_process(delta):
	var direction = Vector3()

	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	if Input.is_action_pressed("ui_up"):
		direction.z -= 1

	if Input.is_action_pressed("ui_down"):
		direction.z += 1

	direction = direction.normalized()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_speed

	velocity = move_and_slide(velocity, Vector3.UP)

	var coin = get_parent().get_node("Coin")

	if coin.visible and translation.distance_to(coin.translation) < 1.5:
		coin.visible = false
		score += 1
		print("Score: ", score)
