extends Control

func _on_play_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	Global.prev_scene_name = "ui_menu"
	get_tree().change_scene_to_file("res://scenes/cutscene_first.tscn")

func _on_exit_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()
