extends Node2D

@onready var label = $Sprite2D/Control/Label
@onready var box = $Sprite2D/Control

var messages = [
	"[ตอนนี้เป็นเวลา 23 : 00]",
	"[ขณะนี้ก็ดึกมากแล้ว แต่ลูเซียดันนึกได้ว่าเธอดันลืมของสำคัญไว้ที่มหาวิทยาลัย]",
	"[เธอต้องกลับไปเอา]"
]

func show_message():
	box.visible = false
	await get_tree().create_timer(3).timeout
	Global.is_paused = true

	for i in range(0, 3):
		box.visible = true
		label.text = messages[i]
		await get_tree().create_timer(3).timeout

	box.visible = false
	Global.is_paused = false
	
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/1_st_front_uni.tscn")

func _ready():
	show_message()
