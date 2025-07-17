extends Node2D

var player_scene = preload("res://scenes/player.tscn")
var player_instance

func _ready():
	player_instance = player_scene.instantiate()
	
	player_instance.global_position = Vector2(180, 110)

	add_child(player_instance)
	player_instance.z_index = 10

	var camera = player_instance.get_node("player/Camera2D")
	camera.limit_left = -190
	camera.limit_right = 218
	camera.limit_top = -120
	camera.limit_bottom = 0
