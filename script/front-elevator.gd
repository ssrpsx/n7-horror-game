extends Node2D

@onready var player_spawn_from_map1 = $Sprite2D/SpawnFromMap1
@onready var player_spawn_from_map2 = $Sprite2D/SpawnFromMap2
var player_scene = preload("res://scenes/player.tscn")
var player_instance

@onready var interact_button = $InteractButton
@onready var e_label = $InteractButton/E_Label
var interaction_position = Vector2(35, 35)
var interaction_distance = 50
var show_interact_ui = false


func _ready():
	player_instance = player_scene.instantiate()
	add_child(player_instance)
	
	match Global.prev_scene_name:
		"cutscene_elevator":
			player_instance.global_position = player_spawn_from_map1.global_position
		"6_th_floor":
			player_instance.get_node("player/AnimatedSprite2D").flip_h = true
			player_instance.global_position = player_spawn_from_map2.global_position
		_:
			player_instance.global_position = player_spawn_from_map1.global_position
	player_instance.z_index = 10

	var camera = player_instance.get_node("player/Camera2D")
	camera.limit_left = -426
	camera.limit_right = 421
	camera.limit_top = -120
	camera.limit_bottom = 0
	
	e_label.visible = false
	interact_button.visible = false

func _process(delta):
	if not player_instance:
		return

	print(player_instance.global_position)
