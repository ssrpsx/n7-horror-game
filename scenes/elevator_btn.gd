extends Control

func _on_button_pressed_1() -> void:
	if Global.prev_scene_name != "1_st_floor2" :
		await get_tree().create_timer(0.1).timeout
		Global.go_to = "1_st_floor2"
		get_tree().change_scene_to_file("res://scenes/cutscene_elevator.tscn")

func _on_button_pressed_2() -> void:
	if Global.prev_scene_name != "7th-front-elevator" :
		await get_tree().create_timer(0.1).timeout
		Global.go_to = "7th-front-elevator"
		get_tree().change_scene_to_file("res://scenes/cutscene_elevator.tscn")


func _on_button_pressed_3() -> void:
	if Global.prev_scene_name != "6th-front-elevator" :
		await get_tree().create_timer(0.1).timeout
		Global.go_to = "6th-front-elevator"
		print("test1")
		get_tree().change_scene_to_file("res://scenes/cutscene_elevator.tscn")


func _on_button_pressed_4() -> void:
	if Global.prev_scene_name != "10th-front-elevator" :
		Global.go_to = "10th-front-elevator"
		await get_tree().create_timer(0.1).timeout
		get_tree().change_scene_to_file("res://scenes/cutscene_elevator.tscn")
