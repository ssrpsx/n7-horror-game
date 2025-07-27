extends Node2D

@onready var label = $Sprite2D/Control/Label
@onready var box = $Sprite2D/Control

var messages = [
	"แต่ถึงจะพูดแบบนั้น ความเจ็บก็ไหลผ่านเข้าร่างกาย มันทำให้เธอตั้งคำถามว่าทำไมเธอถึงไปตาย ๆ ไปแต่แรก",
	"เธอยื่นมือออกไป ก่อนจะเจอเฮกเตอร์ที่ยืนอยู่ตรงหน้า พร้อมกับรอยยิ้มบาง ๆ"
]

func show_message():
	box.visible = false
	await get_tree().create_timer(1).timeout
	Global.is_paused = true

	for i in range(messages.size()):
		box.visible = true
		label.text = messages[i]
		await get_tree().create_timer(3).timeout

	box.visible = false
	Global.is_paused = false
	
	$Sprite2D.texture = load("res://background/Cutscene/hextor_1.png")
	await get_tree().create_timer(4).timeout
	$Sprite2D.texture = load("res://background/Cutscene/gameOver.png")

func _ready():
	show_message()
