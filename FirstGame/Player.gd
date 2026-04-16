extends MeshInstance

var speed = 5
var jump_speed = 5
var velocity_y = 0
var gravity = 9.8
var ground_y = 2

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		translation.x += speed * delta

	if Input.is_action_pressed("ui_left"):
		translation.x -= speed * delta

	if Input.is_action_pressed("ui_up"):
		translation.z -= speed * delta

	if Input.is_action_pressed("ui_down"):
		translation.z += speed * delta

	if Input.is_action_just_pressed("ui_accept") and translation.y <= ground_y:
		velocity_y = jump_speed

	velocity_y -= gravity * delta
	translation.y += velocity_y * delta

	if translation.y < ground_y:
		translation.y = ground_y
		velocity_y = 0

	var coin = get_parent().get_node("Coin")

	if coin.visible and translation.distance_to(coin.translation) < 1.5:
		coin.visible = false
