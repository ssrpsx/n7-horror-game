extends Control

@export var player : Node2D
@onready var hearts : HBoxContainer = $Hearts  # อ้างอิงถึง HBoxContainer ที่เก็บหัวใจ

var max_health : int = 5  # จำนวนหัวใจ 5 อัน
var current_health : int = 5  # เริ่มต้นเลือดเต็ม

@onready var heart_textures = [
preload("res://sprite//heart.png"),  # หัวใจที่มีเลือด
preload("res://sprite/heart_out.png")
]

func _ready():
	# ตั้งค่าเริ่มต้นของหัวใจ
	update_health_ui()

func _process(delta):
	# อัปเดต UI เลือดเมื่อค่าของ current_health เปลี่ยน
	update_health_ui()

func update_health_ui():
	# ตรวจสอบสถานะเลือดและอัปเดตหัวใจให้ถูกต้อง
	for i in range(max_health):
d		var heart = hearts.get_child(i)
		if i < current_health:
			heart.texture = heart_textures[0]  # หัวใจที่มีเลือด
		else:
			heart.texture = heart_textures[1]  # หัวใจที่ไม่มีเลือด
	
