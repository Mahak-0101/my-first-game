extends Camera

onready var player = get_parent().get_node("Player")

func _process(delta):
	translation.x = player.translation.x
	translation.z = player.translation.z + 20
