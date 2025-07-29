extends Node2D

@onready var label = $Sprite2D/Control/Label
@onready var box = $Sprite2D/Control

var messages = [
	"คัตซีนลูเซียมองออกไปนอกหน้าต่าง",
	"[ติ๊ก ต่อก]",
	"[เสียงนาฬิกาเดินเบา ๆ ภายในห้องที่มีเพียงแค่เสียงเลกเชอร์ของอาจารย์ที่ยืนอยู่ตรงหน้าคลอด้วยเสียงกระซิบกระซาบของเหล่านักศึกษาในห้อง]",
	"[ลูเซียนั่งเหม่อมองออกไปนอกหน้าต่าง แสงแดดอ่อน ๆ ส่องผ่านม่านเข้ามา]",
	"เพื่อน “นี่ ได้ยินเรื่องดาวคณะคนใหม่ไหม?”",
	"ลูเซีย “...ใครน่ะ เรามีดาวคณะด้วยหรอ”",
	"เพื่อน “มีสิ พึ่งโดนเลือกเข้ามาเลย หล่อม้ากเลยแหละ อีกอย่างเหมือนจะชื่อเฮกเตอร์ล่ะมั้ง”",
	"ลูเซีย “อ๋อ… หรอ”",
	"[ลูเซียพูดด้วยน้ำเสียงไร้ความสนใจก่อนจะพยักหน้าเบา ๆ ราวกับเห็นด้วยกับเพื่อนตรงหน้า ก่อนเลือกที่จะขอตัวกลับห้องไป]"
]

func show_message():
	box.visible = false
	await get_tree().create_timer(3).timeout
	Global.is_paused = true

	for i in range(0, 4):
		box.visible = true
		label.text = messages[i]
		await get_tree().create_timer(3).timeout

	box.visible = false
	Global.is_paused = false
	
	$Sprite2D.texture = load("res://background/Cutscene/Cutscene_first_2.png")
	await get_tree().create_timer(3).timeout
	for i in range(3, 8):
		box.visible = true
		label.text = messages[i]
		await get_tree().create_timer(3).timeout
		
	await get_tree().create_timer(2).timeout
	Global.prev_scene_name = "first"
	get_tree().change_scene_to_file("res://scenes/apple_bedroom.tscn")

func _ready():
	show_message()
