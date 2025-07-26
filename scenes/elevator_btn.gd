extends Control

func _set_button_green(button: Button) -> void:
	var style = button.get_theme_stylebox("normal")
	if style:
		style = style.duplicate()
		style.bg_color = Color(0, 1, 0)
		button.add_theme_stylebox_override("normal", style)
		button.add_theme_stylebox_override("hover", style)
		button.add_theme_stylebox_override("pressed", style)

func _ready():
	var buttons = {
		"1_st_floor2": $Button1,
		"7th-front-elevator": $Button2,
		"6th-front-elevator": $Button3,
		"10th-front-elevator": $Button4,
	}

	if Global.prev_scene_name in buttons:
		var btn = buttons[Global.prev_scene_name]
		btn.disabled = true
		_set_button_green(btn)
			
func _on_button_pressed_1() -> void:
	if Global.prev_scene_name != "1_st_floor2" :
		await get_tree().create_timer(0.1).timeout
		Global.go_to = "1_st_floor2"
		get_tree().change_scene_to_file("res://scenes/cutscene_elevator.tscn")
	else:
		$Button1.hide()

func _on_button_pressed_2() -> void:
	if Global.prev_scene_name != "7th-front-elevator" :
		await get_tree().create_timer(0.1).timeout
		Global.go_to = "7th-front-elevator"
		get_tree().change_scene_to_file("res://scenes/cutscene_elevator.tscn")


func _on_button_pressed_3() -> void:
	if Global.prev_scene_name != "6th-front-elevator" :
		await get_tree().create_timer(0.1).timeout
		Global.go_to = "6th-front-elevator"
		get_tree().change_scene_to_file("res://scenes/cutscene_elevator.tscn")


func _on_button_pressed_4() -> void:
	if Global.prev_scene_name != "10th-front-elevator" :
		await get_tree().create_timer(0.1).timeout
		Global.go_to = "10th-front-elevator"
		get_tree().change_scene_to_file("res://scenes/cutscene_elevator.tscn")
