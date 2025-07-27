extends Node2D

@onready var label = $Sprite2D/Control/Label
@onready var box = $Sprite2D/Control

var messages = [
	"ลูเซีย “เฮือก!!!” ",
	"เธอยื่นมือออกไป ก่อนจะเจอเฮกเตอร์ที่ยืนอยู่ตรงหน้า พร้อมกับรอยยิ้มบาง ๆ",
	"เธอสะดุ้งตื่นขึ้นมากลางดึก ในห้องนอนที่ดูคุ้นเคย",
	"ตุ๊กตาแพนด้าตกลงมานอนข้าง ๆ เธอ",
	"ทุกอย่างที่ผ่านมา….เป็นเพียงแค่ความฝัน?",
	"แต่ก่อนที่เธอจะกลับไปนอนต่อ เธอก็นึกได้ว่า เธอลืมของสำคัญไว้ที่มหาวิทยาลัย",
	"เธอต้องกลับไปเอา…..?",
	"THE END จบเกมแล้วคร้าบบบ ขอบคุณที่เล่นจนจบครับ <3"
]

func show_message():
	box.visible = false
	await get_tree().create_timer(3).timeout
	Global.is_paused = true

	for i in range(messages.size()):
		box.visible = true
		label.text = messages[i]
		await get_tree().create_timer(3).timeout

	box.visible = false
	Global.is_paused = false
	await get_tree().create_timer(3).timeout

func _ready():
	show_message()
