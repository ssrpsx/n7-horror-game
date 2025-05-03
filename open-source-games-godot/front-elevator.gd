extends Node2D

var player_scene = preload("res://player.tscn")

func _ready():
	var player_instance = player_scene.instantiate()
	add_child(player_instance)

	# ตั้ง Z-index ของ player ให้สูงสุด
	player_instance.z_index = 10
