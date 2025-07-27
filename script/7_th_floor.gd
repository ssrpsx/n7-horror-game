extends Node2D

@onready var player_spawn_from_map1 = $Sprite2D/SpawnFromMap1
@onready var player_spawn_from_map2 = $Sprite2D/SpawnFromMap2
@onready var player_spawn_from_map3 = $Sprite2D/SpawnFromMap3
var player_scene = preload("res://scenes/player.tscn")
var player_instance
var body

@onready var e_label = $E_Label
@onready var btn1 = $btn1
@onready var btn2 = $btn2
@onready var btn3 = $btn3
var show_interact_ui = false

var show_interact_ui_f = false
@onready var f_label = $F_Label
@onready var key = $Sprite2D/Sprite2D

func _ready():
	player_instance = player_scene.instantiate()
	add_child(player_instance)
	body = player_instance.get_node("player");
	
	match Global.prev_scene_name:
		"7th-front-elevator":
			body.get_node("AnimatedSprite2D").flip_h = true
			body.global_position = player_spawn_from_map1.global_position
		"7_th_lab":
			body.get_node("AnimatedSprite2D").flip_h = true
			body.global_position = player_spawn_from_map2.global_position
		"common":
			body.global_position = player_spawn_from_map3.global_position
		_:
			body.global_position = player_spawn_from_map1.global_position

	player_instance.z_index = 10

	var camera = player_instance.get_node("player/Camera2D")
	camera.limit_left = -1259
	camera.limit_right = 1269
	camera.limit_top = -120
	camera.limit_bottom = 0

	e_label.visible = false
	
	if Global.key2:
		key.visible = false
		f_label.visible = false
	else:
		key.visible = true

func _process(_delta):
	if not player_instance:
		return

	var body_pos = body.global_position
	var distance_btn1 = abs(body_pos.x - btn1.global_position.x)
	var distance_btn2 = abs(body_pos.x - btn2.global_position.x)
	var distance_btn3 = abs(body_pos.x - btn3.global_position.x)
	var distance_btnkey = abs(body_pos.x - $key.global_position.x)

	var is_near_btn1 = distance_btn1 <= 80
	var is_near_btn2 = distance_btn2 <= 80
	var is_near_btn3 = distance_btn3 <= 80
	var is_near_btnkey = distance_btnkey <= 50
	
	if is_near_btn1:
		e_label.global_position = btn1.global_position
	elif is_near_btn2:
		e_label.global_position = btn2.global_position
	elif is_near_btn3:
		e_label.global_position = btn3.global_position

	var should_show = is_near_btn1 or is_near_btn2 or is_near_btn3

	if should_show:
		if not show_interact_ui:
			e_label.visible = true
			show_interact_ui = true
	else:
		if show_interact_ui:
			e_label.visible = false
			show_interact_ui = false
	
	if is_near_btnkey:
		f_label.global_position = $key.global_position
		
	var should_show_f = is_near_btnkey
	
	if not Global.key2:
		if should_show_f:
			if not show_interact_ui_f:
				f_label.visible = true
				show_interact_ui_f = true
		else:
			if show_interact_ui_f:
				f_label.visible = false
				show_interact_ui_f = false
				
	if Input.is_action_just_pressed("interact"):
		if is_near_btn1:
			Global.prev_scene_name = "7_th_floor"
			get_tree().change_scene_to_file("res://scenes/7_th_front_elevator.tscn")
		elif is_near_btn2:
			Global.prev_scene_name = "7_th_floor"
			get_tree().change_scene_to_file("res://scenes/7_th_lab.tscn")
		elif is_near_btn3:
			Global.prev_scene_name = "7_th_floor"
			get_tree().change_scene_to_file("res://scenes/common.tscn")
			
	if Input.is_action_just_pressed("interact_f"):
		if key.visible == true:
			Global.score += 1
		key.visible = false
		f_label.visible = false
		Global.key2 = true
