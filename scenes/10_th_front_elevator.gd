extends Node2D

@onready var player_spawn_from_map1 = $Sprite2D/SpawnFromMap1
@onready var player_spawn_from_map2 = $Sprite2D/SpawnFromMap2
var player_scene = preload("res://scenes/player.tscn")
var player_instance
var body

@onready var e_label = $E_Label
@onready var btn1 = $btn1
@onready var btn2 = $btn2
var show_interact_ui = false

func _ready():
	player_instance = player_scene.instantiate()
	add_child(player_instance)
	body = player_instance.get_node("player");
	
	match Global.prev_scene_name:
		"cutscene_elevator":
			body.global_position = player_spawn_from_map1.global_position
		"rooftop_1":
			body.get_node("AnimatedSprite2D").flip_h = true
			body.global_position = player_spawn_from_map2.global_position
		_:
			body.global_position = player_spawn_from_map1.global_position
	player_instance.z_index = 10

	var camera = player_instance.get_node("player/Camera2D")
	camera.limit_left = -426
	camera.limit_right = 421
	camera.limit_top = -120
	camera.limit_bottom = 0
	
	e_label.visible = false

func _process(_delta):
	if not player_instance:
		return

	var body_pos = body.global_position
	var distance_btn1 = abs(body_pos.x - btn1.global_position.x)
	var distance_btn2 = abs(body_pos.x - btn2.global_position.x)

	var is_near_btn1 = distance_btn1 <= 80
	var is_near_btn2 = distance_btn2 <= 80
	
	if is_near_btn1:
		e_label.global_position = btn1.global_position
	elif is_near_btn2:
		e_label.global_position = btn2.global_position

	var should_show = is_near_btn1 or is_near_btn2

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
			Global.prev_scene_name = "10th-front-elevator"
			get_tree().change_scene_to_file("res://scenes/elevator_btn.tscn")
		elif is_near_btn2:
			Global.prev_scene_name = "10th-front-elevator"
			get_tree().change_scene_to_file("res://scenes/rooftop_1.tscn")
