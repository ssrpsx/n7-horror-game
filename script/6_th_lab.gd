extends Node2D

@onready var player_spawn_from_map1 = $Sprite2D/SpawnFromMap1
var player_scene = preload("res://scenes/player.tscn")
var player_instance
var body

@onready var e_label = $E_Label
@onready var btn1 = $btn1
var show_interact_ui = false

func _ready():
	player_instance = player_scene.instantiate()
	add_child(player_instance)
	body = player_instance.get_node("player");
	
	match Global.prev_scene_name:
		_:
			body.global_position = player_spawn_from_map1.global_position
	player_instance.z_index = 10

	var camera = player_instance.get_node("player/Camera2D")
	camera.limit_left = -415
	camera.limit_right = 425
	camera.limit_top = -120
	camera.limit_bottom = 0
	
	e_label.visible = false

func _process(_delta):
	if not player_instance:
		return

	var body_pos = body.global_position
	var distance_btn1 = abs(body_pos.x - btn1.global_position.x)

	var is_near_btn1 = distance_btn1 <= 80
	
	if is_near_btn1:
		e_label.global_position = btn1.global_position

	var should_show = is_near_btn1

	if should_show:
		if not show_interact_ui:
			e_label.visible = true
			show_interact_ui = true
	else:
		if show_interact_ui:
			e_label.visible = false
			show_interact_ui = false
	
	if Input.is_action_just_pressed("interact"):
		if is_near_btn1:
			Global.prev_scene_name = "6_th_lab"
			get_tree().change_scene_to_file("res://scenes/6_th_floor.tscn")
